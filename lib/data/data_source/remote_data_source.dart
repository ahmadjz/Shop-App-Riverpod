import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/network/app_api.dart';
import 'package:shop_app_riverpod/data/response/responses.dart';
import 'package:shop_app_riverpod/domain/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<TokenCheckResponse> checkToken(UserToken token);
  Future<LogoutResponse> logout(UserToken token);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient appServiceClient;

  RemoteDataSourceImplementer({required this.appServiceClient});

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<TokenCheckResponse> checkToken(UserToken token) async {
    return await appServiceClient.checkToken("Bearer $token");
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await appServiceClient.register(
        registerRequest.name,
        registerRequest.email,
        registerRequest.password,
        registerRequest.password);
  }

  @override
  Future<LogoutResponse> logout(UserToken token) async {
    return await appServiceClient.logout(
      "Bearer $token",
    );
  }
}
