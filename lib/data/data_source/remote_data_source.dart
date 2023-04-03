import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/network/app_api.dart';
import 'package:shop_app_riverpod/data/response/responses.dart';
import 'package:shop_app_riverpod/domain/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<TokenCheckResponse> checkToken(UserToken token);
  Future<LogoutResponse> logout(UserToken token);
  Future<ProductsResponse> fetchProducts(int page);
  Future<CartResponse> addProductToCart(
      int productId, int quantity, UserToken token);
  Future<CartResponse> getCart(UserToken token);
  Future<CartResponse> removeProductFromCart(
    int productId,
    UserToken token,
  );
  Future<ProductResponse> getProduct(int productId);
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

  @override
  Future<ProductsResponse> fetchProducts(int page) async {
    return await appServiceClient.fetchProducts(
      10,
      page,
    );
  }

  @override
  Future<CartResponse> addProductToCart(
      int productId, int quantity, UserToken token) async {
    return await appServiceClient.addProductToCart(
      productId,
      quantity,
      "Bearer $token",
    );
  }

  @override
  Future<CartResponse> getCart(UserToken token) async {
    return await appServiceClient.getCart(
      "Bearer $token",
    );
  }

  @override
  Future<CartResponse> removeProductFromCart(
      int productId, UserToken token) async {
    return await appServiceClient.removeProductFromCart(
      productId,
      "Bearer $token",
    );
  }

  @override
  Future<ProductResponse> getProduct(int productId) async {
    return await appServiceClient.getProduct(
      productId,
    );
  }
}
