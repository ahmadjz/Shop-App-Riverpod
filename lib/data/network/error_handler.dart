import 'package:dio/dio.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.other:
      return DataSource.defaultError.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.data["message"] != null) {
        return Failure(
          code: error.response?.statusCode ?? 0,
          message: error.response?.data["message"],
        );
      } else {
        return DataSource.defaultError.getFailure();
      }
  }
}

enum DataSource {
  defaultError,
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internetServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: AppStrings.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: AppStrings.noContent,
        );

      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: AppStrings.badRequest,
        );

      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: AppStrings.forbidden,
        );

      case DataSource.unAuthorized:
        return Failure(
          code: ResponseCode.unAuthorized,
          message: AppStrings.unAuthorized,
        );

      case DataSource.notFound:
        return Failure(
          code: ResponseCode.notFound,
          message: AppStrings.notFound,
        );

      case DataSource.internetServerError:
        return Failure(
          code: ResponseCode.internetServerError,
          message: AppStrings.internetServerError,
        );

      case DataSource.connectTimeOut:
        return Failure(
          code: ResponseCode.connectTimeOut,
          message: AppStrings.connectTimeOut,
        );

      case DataSource.cancel:
        return Failure(
          code: ResponseCode.cancel,
          message: AppStrings.cancel,
        );

      case DataSource.receiveTimeOut:
        return Failure(
          code: ResponseCode.receiveTimeOut,
          message: AppStrings.receiveTimeOut,
        );

      case DataSource.sendTimeOut:
        return Failure(
          code: ResponseCode.sendTimeOut,
          message: AppStrings.sendTimeOut,
        );

      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: AppStrings.cacheError,
        );

      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: AppStrings.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          code: ResponseCode.defaultError,
          message: AppStrings.defaultError,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorized = 401;
  static const int notFound = 404;
  static const int internetServerError = 500;

  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -6;
}
