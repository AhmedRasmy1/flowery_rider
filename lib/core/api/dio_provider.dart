import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/cashed_data_shared_preferences.dart';

Dio dioProvider() {
  Dio dio2 = Dio();
  dio2.options.headers["Content-Type"] = "multipart/form-data";
  dio2.options.headers["Authorization"] =
  "Bearer ${CacheService.getData(key: CacheConstants.userToken)}";
  dio2.options.contentType = 'multipart/form-data';
  dio2.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true));

  return dio2;
}