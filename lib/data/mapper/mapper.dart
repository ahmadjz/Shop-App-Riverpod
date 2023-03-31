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
