import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/data/data_source/remote_data_source.dart';
import 'package:shop_app_riverpod/data/network/app_api.dart';
import 'package:shop_app_riverpod/data/network/dio_factory.dart';
import 'package:shop_app_riverpod/data/network/network_info.dart';
import 'package:shop_app_riverpod/data/repository/repository_implementer.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(
      sharedPreferences: instance<SharedPreferences>(),
    ),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementer(
      internetConnectionChecker: InternetConnectionChecker(),
    ),
  );

  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(),
  );

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(
      dio,
    ),
  );

  instance.registerLazySingleton<Repository>(
    () => RepositoryImplementer(
      networkInfo: instance<NetworkInfo>(),
      remoteDataSource: instance<RemoteDataSource>(),
      appPreferences: instance<AppPreferences>(),
    ),
  );

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(
      appServiceClient: instance<AppServiceClient>(),
    ),
  );
}
