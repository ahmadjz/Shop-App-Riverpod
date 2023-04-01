import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shop_app_riverpod/app/resources/constants_manager.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/response/responses.dart';

part 'app_api.g.dart';

const String authorization = "authorization";
const String perPage = "perpage";
const String page = "page";

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("user/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("user/register")
  Future<AuthenticationResponse> register(
    @Field("name") String name,
    @Field("email") String email,
    @Field("password") String password,
    @Field("password_confirmation") String passwordConfirmation,
  );

  @GET("user/check")
  Future<TokenCheckResponse> checkToken(
      @Header(authorization) UserToken bearerToken);

  @POST("user/logout")
  Future<LogoutResponse> logout(@Header(authorization) UserToken bearerToken);

  @GET("product")
  Future<ProductsResponse> fetchProducts(
    @Query(perPage) int perPage,
    @Query(page) int page,
  );
}
