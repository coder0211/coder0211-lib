// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

enum API_STATUS { SUSSCESSED, FAILED }

class BaseDataAPI {
  dynamic object;
  var apiStatus;
  BaseDataAPI({this.object, this.apiStatus});
}

class BaseAPI {
  static String API = '';
  final Dio _dio = Dio();
  BaseAPI();

  Future<BaseDataAPI> getData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    String method = 'get',
  }) async {
    Response response;
    print('API:GET:::::::::::::::::::================--------------->\n');
    print('url: $API$url');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = method;
      response = await _dio.request(API + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      print('Error [GET API]: $e');
      print('END API GET<---------------================:::::::::::::::\n');

      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    if (response.data is DioError) {
      print('Error [GET API]: ${response.data}');
      print('END API GET<---------------================:::::::::::::::\n');

      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    print('Success [GET API]: ${response.data}');
    print('END API GET<---------------================:::::::::::::::\n');
    return BaseDataAPI(object: response.data, apiStatus: API_STATUS.SUSSCESSED);
  }

  Future<BaseDataAPI> postData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    String method = 'post',
  }) async {
    Response response;
    print('API:POST:::::::::::::::::::================--------------->\n');
    print('url: $API$url');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = method;
      response = await _dio.request(API + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      print('Error [POST API]: $e');
      print('END API POST<---------------================:::::::::::::::\n');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    if (response.data is DioError) {
      print('Error [POST API]: ${response.data}');
      print('END API POST<---------------================:::::::::::::::\n');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    print('Success [POST API]: ${response.data}');
    print('END API POST<---------------================:::::::::::::::\n');
    return BaseDataAPI(object: response.data, apiStatus: API_STATUS.SUSSCESSED);
  }
}
