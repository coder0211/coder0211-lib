import 'package:dio/dio.dart';

enum API_STATUS { SUSSCESSED, FAILED }

class BaseAPI {
  BaseAPI._();

  static String API = '';

  static Future<T?> getData<T>({
    required String route,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await Dio().get('$API/$route',
          cancelToken: cancelToken,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
          options: options);
      return response.data as T;
    } catch (e) {
      return null;
    }
  }

  static Future<T?> postData<T>({
    required String route,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await Dio().post('$API/$route',
          cancelToken: cancelToken,
          data: data,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          onSendProgress: onSendProgress,
          options: options);
      return response.data as T;
    } catch (e) {
      return null;
    }
  }
}
