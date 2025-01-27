import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



Dio registerDioProvider() {
  Dio registerDio = Dio();

 // registerDio.options.contentType = 'multipart/form-data';
  registerDio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true));

  return registerDio;
}