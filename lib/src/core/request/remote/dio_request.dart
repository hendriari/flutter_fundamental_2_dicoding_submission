import 'dart:io';
import 'package:fluttter_fundamental_submission_2/src/core/error/dio_exception_handler.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/exception.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@injectable
class DioRequest {
  final Dio _dio = Dio();
  final ConstantsBaseUrl _constantsBaseUrl;
  final DioExceptionHandler _dioExceptionHandler;

  DioRequest(
    this._constantsBaseUrl,
    this._dioExceptionHandler,
    @Named('headers') Map<String, dynamic>? headers,
  ) {
    _dio.options = BaseOptions(
      baseUrl: _constantsBaseUrl.baseUrl,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      responseType: ResponseType.json,
      headers: headers ??
          {
            'Content-Type': 'application/json',
          },
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async => handler.next(options),
        onResponse: (response, handler) async => handler.next(response),
        onError: (exception, handler) async => handler.next(exception),
      ),
    );
  }

  Future<Response?> put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.put(
        url,
        queryParameters: param,
        data: body,
      );
    } on DioException catch (e) {
      String errorMessage = _dioExceptionHandler.dioErrorHandler(e);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ConnectionException(
            message:
                'You have an unstable network, please try again when network stabilizes.');
      } else if (e.type == DioExceptionType.connectionError ||
          (e.type == DioExceptionType.unknown && e.error is SocketException)) {
        throw const ConnectionException(
            message: "No internet connection, please try again.");
      } else if (e.type == DioExceptionType.unknown) {
        throw GeneralException(
            message: "An unknown error occurred.\n$errorMessage");
      } else {
        throw ServerException(message: 'Failed: $errorMessage');
      }
    } catch (e) {
      throw GeneralException(message: "An unknown error occurred.\n$e");
    }
  }

  Future<Response?> get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: param,
      );
    } on DioException catch (e) {
      String errorMessage = _dioExceptionHandler.dioErrorHandler(e);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ConnectionException(
            message:
                'You have an unstable network, please try again when network stabilizes.');
      } else if (e.type == DioExceptionType.connectionError ||
          (e.type == DioExceptionType.unknown && e.error is SocketException)) {
        throw const ConnectionException(
            message: "No internet connection, please try again.");
      } else if (e.type == DioExceptionType.unknown) {
        throw GeneralException(
            message: "An unknown error occurred.\n$errorMessage");
      } else {
        throw ServerException(message: 'Failed: $errorMessage');
      }
    } catch (e) {
      throw GeneralException(message: "An unknown error occurred.\n$e");
    }
  }

  Future<Response?> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.post(
        url,
        queryParameters: param,
        data: body,
      );
    } on DioException catch (e) {
      String errorMessage = _dioExceptionHandler.dioErrorHandler(e);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ConnectionException(
            message:
                'You have an unstable network, please try again when network stabilizes.');
      } else if (e.type == DioExceptionType.connectionError ||
          (e.type == DioExceptionType.unknown && e.error is SocketException)) {
        throw const ConnectionException(
            message: "No internet connection, please try again.");
      } else if (e.type == DioExceptionType.unknown) {
        throw GeneralException(
            message: "An unknown error occurred.\n$errorMessage");
      } else {
        throw ServerException(message: 'Failed: $errorMessage');
      }
    } catch (e) {
      throw GeneralException(message: "An unknown error occurred.\n$e");
    }
  }

  Future<Response?> delete({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.delete(
        url,
        queryParameters: param,
      );
    } on DioException catch (e) {
      String errorMessage = _dioExceptionHandler.dioErrorHandler(e);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ConnectionException(
            message:
                'You have an unstable network, please try again when network stabilizes.');
      } else if (e.type == DioExceptionType.connectionError ||
          (e.type == DioExceptionType.unknown && e.error is SocketException)) {
        throw const ConnectionException(
            message: "No internet connection, please try again.");
      } else if (e.type == DioExceptionType.unknown) {
        throw GeneralException(
            message: "An unknown error occurred.\n$errorMessage");
      } else {
        throw ServerException(message: 'Failed: $errorMessage');
      }
    } catch (e) {
      throw GeneralException(message: "An unknown error occurred.\n$e");
    }
  }
}
