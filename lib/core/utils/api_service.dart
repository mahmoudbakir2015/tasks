import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static init({bool isBaseUrl = true}) {
    dio = Dio(
      BaseOptions(
          baseUrl: Constansts.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            // "Authorization": 'Bearer ${CacheHelper.getData(key: "Token")}',
            'Content-Type': 'application/json',
            // "lang": CacheHelper.getData(key: "lang") == "ar_EG" ? "ar" : "en",
            "Accept": "application/json"
          }),
    );

    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    dio!.interceptors.add(ErrorInterceptor());
  }

  static Future<Response> postData({
    required String endPoint,
    required dynamic data,
  }) {
    return dio!.post(endPoint, data: data);
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    return dio!.get(endPoint, queryParameters: queryParameters, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url, queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url, queryParameters: data);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log("statusCode == 401");
    } else if (err.response?.statusCode == 403) {
      log("statusCode == 403");
    } else {
      log("statusCode == 500${err.response?.statusCode!}");
    }
    return super.onError(err, handler);
  }
}
