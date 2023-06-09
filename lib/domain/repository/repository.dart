import 'package:dartz/dartz.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';
import 'package:shop_app_riverpod/domain/requests.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, UserData>> checkToken(UserToken token);
  Future<Either<Failure, LogoutData>> logout(UserToken token);
  Future<Either<Failure, ProductsData>> fetchProducts(int page);
  Future<Either<Failure, CartData>> addProductToCart(
      int productId, int quantity, UserToken token);
  Future<Either<Failure, CartData>> getCart(UserToken token);
  Future<Either<Failure, CartData>> removeProductFromCart(
    int productId,
    UserToken token,
  );
  Future<Either<Failure, ProductData>> getProduct(
    int productId,
  );
}
