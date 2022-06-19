import 'package:dio/dio.dart';

enum API_STATUS { SUSSCESSED, FAILED }

class BaseDataAPI {
  dynamic object;
  var apiStatus;
  BaseDataAPI({this.object, this.apiStatus});
}

void printLogYellow(String message) {
  print('\x1B[33m$message\x1B[0m');
}

void printLogError(String message) {
  print('\x1B[31m$message\x1B[0m');
}

void printLogSusscess(String message) {
  print('\x1B[32m$message\x1B[0m');
}

class BaseAPI {
  ///#[API] is domain of API
  static String API = '';
  final Dio _dio = Dio();
  BaseAPI();

  ///#[get] is get method of API
  ///param[url] is url of API without domain
  ///param[params] is params of API with key and value
  ///param[body] is body of API with key and value
  Future<BaseDataAPI> getData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    String method = 'get',
  }) async {
    Response response;
    printLogYellow(
        'API:GET:::::::::::::::::::================--------------->');
    print('url: $API$url');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = method;
      response = await _dio.request(API + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      printLogError('Error [GET API]: $e');
      printLogYellow(
          'END API GET<---------------================:::::::::::::::');

      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    if (response.data is DioError) {
      printLogError('Error [GET API]: ${response.data}');
      printLogYellow(
          'END API GET<---------------================:::::::::::::::');

      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    printLogSusscess('Success [GET API]: ${response.data}');
    printLogYellow(
        'END API GET<---------------================:::::::::::::::');
    return BaseDataAPI(object: response.data, apiStatus: API_STATUS.SUSSCESSED);
  }

  ///#[post] is get method of API
  ///param[url] is url of API without domain
  ///param[params] is params of API with key and value
  ///param[body] is body of API with key and value
  Future<BaseDataAPI> postData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    String method = 'post',
  }) async {
    Response response;
    printLogYellow(
        'API:POST:::::::::::::::::::================--------------->');
    print('url: $API$url');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = method;
      response = await _dio.request(API + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      printLogError('Error [POST API]: $e');
      printLogYellow(
          'END API POST<---------------================:::::::::::::::');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    if (response.data is DioError) {
      printLogError('Error [POST API]: ${response.data}');
      printLogYellow(
          'END API POST<---------------================:::::::::::::::');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    printLogSusscess('Success [POST API]: ${response.data}');
    printLogYellow(
        'END API POST<---------------================:::::::::::::::');
    return BaseDataAPI(object: response.data, apiStatus: API_STATUS.SUSSCESSED);
  }

  ///#[put] is get method of API
  ///param[url] is url of API without domain
  ///param[params] is params of API with key and value
  ///param[body] is body of API with key and value
  Future<BaseDataAPI> putData(
    url, {
    dynamic body,
    Map<String, dynamic>? params,
    String method = 'put',
  }) async {
    Response response;
    printLogYellow(
        'API:PUT:::::::::::::::::::================--------------->');
    print('url: $API$url');
    print('params: $params');
    print('body: $body');
    try {
      Options options = Options();
      options.method = method;
      response = await _dio.request(API + url,
          data: body, queryParameters: params, options: options);
    } on DioError catch (e) {
      printLogError('Error [PUT API]: $e');
      printLogYellow(
          'END API PUT<---------------================:::::::::::::::');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    if (response.data is DioError) {
      printLogError('Error [PUT API]: ${response.data}');
      printLogYellow(
          'END API put<---------------================:::::::::::::::');
      return BaseDataAPI(object: [], apiStatus: API_STATUS.FAILED);
    }
    printLogSusscess('Success [PUT API]: ${response.data}');
    printLogYellow(
        'END API put<---------------================:::::::::::::::');
    return BaseDataAPI(object: response.data, apiStatus: API_STATUS.SUSSCESSED);
  }
}
