import 'package:dio/dio.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
   Dio providerDio() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true));

    return dio;
  }
}


