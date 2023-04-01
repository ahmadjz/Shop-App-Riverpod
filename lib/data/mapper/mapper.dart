import 'package:shop_app_riverpod/app/resources/constants_manager.dart';
import 'package:shop_app_riverpod/data/response/responses.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';

extension UserDataMapper on UserResponse? {
  UserData toDomain() {
    return UserData(
      id: this?.id ?? AppConstants.zero,
      name: this?.name ?? AppConstants.empty,
      email: this?.email ?? AppConstants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      userData: this?.userData.toDomain(),
      userToken: this?.token ?? AppConstants.empty,
    );
  }
}

extension TokenCheckResponseMapper on TokenCheckResponse? {
  UserData toDomain() {
    return UserData(
      id: this?.userData?.id ?? AppConstants.zero,
      name: this?.userData?.name ?? AppConstants.empty,
      email: this?.userData?.email ?? AppConstants.empty,
    );
  }
}

extension LogoutResponseMapper on LogoutResponse? {
  LogoutData toDomain() {
    return LogoutData(
      message: this?.message ?? AppConstants.empty,
    );
  }
}

extension ProductResponseMapper on ProductResponse? {
  ProductData toDomain() {
    return ProductData(
      id: this?.id ?? AppConstants.zero,
      title: this?.title ?? AppConstants.empty,
      description: this?.description ?? AppConstants.empty,
      price: this?.price?.formatted ?? AppConstants.empty,
      imageUrl:
          this?.image?.conversions?.defaultConversion ?? AppConstants.empty,
    );
  }
}

extension MetaResponseMapper on MetaResponse? {
  MetaData toDomain() {
    return MetaData(
      currentPage: this?.currentPage ?? AppConstants.zero,
      lastPage: this?.lastPage ?? AppConstants.zero,
    );
  }
}

extension AllProductsResponseMapper on ProductsResponse? {
  ProductsData toDomain() {
    List<ProductData> products =
        (this?.products?.map((productResponse) => productResponse.toDomain()) ??
                const Iterable.empty())
            .cast<ProductData>()
            .toList();
    return ProductsData(
      products: products,
      meta: this?.meta.toDomain(),
    );
  }
}
