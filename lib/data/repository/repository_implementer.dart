import 'package:dartz/dartz.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/data_source/remote_data_source.dart';
import 'package:shop_app_riverpod/data/mapper/mapper.dart';
import 'package:shop_app_riverpod/data/network/error_handler.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/data/network/network_info.dart';
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
}
