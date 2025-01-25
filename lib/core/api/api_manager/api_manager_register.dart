import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'register_dio_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/data/models/response/register_response_dto.dart';
import '../api_constants.dart';

@injectable
@singleton
class RegisterApiManager {
  Future<RegisterResponseDto> signUp({
    required String country,
    required String firstName,
    required String lastName,
    required String vehicleType,
    required String vehicleNumber,
    required File vehicleLicense,
    required String nid,
    required File nidImg,
    required String email,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  }) async {
    FormData data = FormData();

    data.fields.addAll([
      MapEntry('country', country),
      MapEntry('firstName', firstName),
      MapEntry('lastName', lastName),
      MapEntry('vehicleType', vehicleType),
      MapEntry('vehicleNumber', vehicleNumber),
      MapEntry('NID', nid),
      MapEntry('email', email),
      MapEntry('password', password),
      MapEntry('rePassword', rePassword),
      MapEntry('gender', gender),
      MapEntry('phone', phone),
    ]);

    data.files.addAll([
      MapEntry(
        'vehicleLicense',
        await MultipartFile.fromFile(
          vehicleLicense.path,
          contentType: MediaType("image", vehicleLicense.path.split(".").last),
          filename: vehicleLicense.path.split('.').first,
        ),
      ),
      MapEntry(
        'NIDImg',
        await MultipartFile.fromFile(
          nidImg.path,
          contentType: MediaType("image", nidImg.path.split(".").last),
          filename: nidImg.path.split('.').first,
        ),
      ),
    ]);

    Dio dio = registerDioProvider();
    var response = await dio.post(
      "${ApiConstants.baseUrl}${ApiConstants.signupRoute}",
      data: data,
      options: Options(
        method: 'POST',
      ),
    );
    return RegisterResponseDto.fromJson(response.data);
  }
}
