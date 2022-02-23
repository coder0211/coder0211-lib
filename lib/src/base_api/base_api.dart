import 'package:dio/dio.dart';

enum API_STATUS { SUSSCESSED, FAILED }

class BaseDataAPI<T> {
  T? object;
  var apiStatus;
  BaseDataAPI({this.object, this.apiStatus});
}

class BaseAPI {
  BaseAPI._();

  static String API = '';

  static Future<BaseDataAPI<T>> getData<T>({
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
      if (response.statusCode == 200) {
        return BaseDataAPI(
            object: response.data as T, apiStatus: API_STATUS.SUSSCESSED);
      } else
        return BaseDataAPI(object: null, apiStatus: API_STATUS.FAILED);
    } catch (e) {
      print('Error [GET API]: $e');
      return BaseDataAPI(object: null, apiStatus: API_STATUS.FAILED);
    }
  }

  static Future<BaseDataAPI<T>> postData<T>({
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
      if (response.statusCode == 200) {
        return BaseDataAPI(
            object: response.data as T, apiStatus: API_STATUS.SUSSCESSED);
      } else
        return BaseDataAPI(object: null, apiStatus: API_STATUS.FAILED);
    } catch (e) {
      print('Error [POST API]: $e');
      return BaseDataAPI(object: null, apiStatus: API_STATUS.FAILED);
    }
  }
}
