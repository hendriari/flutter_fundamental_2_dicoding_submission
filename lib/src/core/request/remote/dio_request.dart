import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@injectable
class DioRequest {
  final Dio _dio = Dio();
  final ConstantsBaseUrl _constantsBaseUrl;

  DioRequest(
    this._constantsBaseUrl,
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
}
