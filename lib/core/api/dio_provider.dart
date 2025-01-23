import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioProvider() {
  Dio dio = Dio();
  // dio.options.headers["Content-Type"] = "multipart/form-data";
  // dio.options.headers["Authorization"] =
  // "Bearer ${CacheService.getData(key: CacheConstants.userToken)}";
  // dio.options.contentType = 'multipart/form-data';
  dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true));

  return dio;
}
