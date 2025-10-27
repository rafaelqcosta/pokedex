import 'package:dio/dio.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/cubit/failure.dart';

class DioHttpService {
  late Dio _dio;

  DioHttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
      ),
    ]);
  }

  Future<Response<T>> interceptRequests<T>(Future<Response<T>> request) async {
    try {
      final result = await request;
      return result;
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerFailure();
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw TimeOutFailure();
      }

      switch (e.response?.statusCode) {
        case 400:
          throw InvalidOrMissingFieldFailure();
        case 404:
          throw TooManyRequests();
        case 429:
          throw TimeOutFailure();
        case 500:
          throw ServerFailure();
        default:
          throw UnexpectedFailure(message: 'Ocorreu um erro inesperado: ${e.message}');
      }
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await (interceptRequests(
      _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    ));
  }

  Future<Response<T>> getUri<T>(Uri uri) async {
    return await (interceptRequests(_dio.getUri<T>(uri)));
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await (interceptRequests(
      _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    ));
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await (interceptRequests(
      _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    ));
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await (interceptRequests(
      _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    ));
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await (interceptRequests(
      _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    ));
  }
}
