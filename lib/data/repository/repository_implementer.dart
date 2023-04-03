import 'package:dartz/dartz.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/data_source/remote_data_source.dart';
import 'package:shop_app_riverpod/data/mapper/mapper.dart';
import 'package:shop_app_riverpod/data/network/error_handler.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/data/network/network_info.dart';
import 'package:shop_app_riverpod/data/response/responses.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/domain/requests.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource remoteDataSource;
  final AppPreferences appPreferences;
  final NetworkInfo networkInfo;
  RepositoryImplementer({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.appPreferences,
  });

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);
        final Authentication authentication = response.toDomain();
        appPreferences.setUserToken(authentication.userToken);
        return Right(authentication);
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(registerRequest);
        final Authentication authentication = response.toDomain();
        appPreferences.setUserToken(authentication.userToken);
        return Right(authentication);
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> checkToken(UserToken token) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.checkToken(token);
        final UserData userData = response.toDomain();
        return Right(userData);
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, LogoutData>> logout(UserToken token) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.logout(token);
        final LogoutData userData = response.toDomain();
        return Right(userData);
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsData>> fetchProducts(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.fetchProducts(page);
        final ProductsData productsData = response.toDomain();
        return Right(
          productsData,
        );
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, ProductData>> getProduct(int productId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getProduct(productId);
        final ProductData productsData = response.toDomain();
        return Right(
          productsData,
        );
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, CartData>> addProductToCart(
      int productId, int quantity, UserToken token) async {
    return _handleCartOperation(
      () => remoteDataSource.addProductToCart(productId, quantity, token),
    );
  }

  @override
  Future<Either<Failure, CartData>> getCart(UserToken token) async {
    return _handleCartOperation(() => remoteDataSource.getCart(token));
  }

  @override
  Future<Either<Failure, CartData>> removeProductFromCart(
      int productId, UserToken token) async {
    return _handleCartOperation(
      () => remoteDataSource.removeProductFromCart(productId, token),
    );
  }

  Future<Either<Failure, CartData>> _handleCartOperation(
      Future<CartResponse> Function() operation) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await operation();
        CartData cartData = response.toDomain();
        // using this method to get the name for each product is not best practice because it makes too many requests
        final updatedCartDataResult =
            await _fetchAndUpdateProductNames(cartData);

        return updatedCartDataResult.fold(
          (failure) => Left(failure),
          (updatedCartData) => Right(updatedCartData),
        );
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  Future<Either<Failure, CartData>> _fetchAndUpdateProductNames(
      CartData cartData) async {
    final updatedProductsInCart = <ProductInCartData>[];

    for (var productInCart in cartData.productsInCart) {
      final result = await getProduct(productInCart.productId);

      final Either<Failure, ProductInCartData> updatedProductInCart =
          result.fold(
        (failure) {
          return Left(failure);
        },
        (productData) {
          return Right(ProductInCartData(
            id: productInCart.id,
            productId: productInCart.productId,
            productName: productData.title,
            totalQuantity: productInCart.totalQuantity,
            totalPrice: productInCart.totalPrice,
            unitPrice: productInCart.unitPrice,
          ));
        },
      );

      final updatedProduct = updatedProductInCart.fold(
        (failure) => null,
        (product) => product,
      );

      if (updatedProduct != null) {
        updatedProductsInCart.add(updatedProduct);
      } else {
        return Left(
          DataSource.defaultError.getFailure(),
        );
      }
    }

    return Right(
      CartData(
        id: cartData.id,
        totalPrice: cartData.totalPrice,
        itemCounts: cartData.itemCounts,
        productsInCart: updatedProductsInCart,
      ),
    );
  }
}
