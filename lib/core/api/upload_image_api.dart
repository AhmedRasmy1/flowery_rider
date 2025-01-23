import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import '../utils/cashed_data_shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'api_constants.dart';
import 'dio_provider.dart';
import 'model/upLoad_image_response.dart';

class UploadImageApiManger {
  String token = CacheService.getData(key: CacheConstants.userToken);

  Future<UpLoadImageResponse> uploadImage(
      {required File imageFile, required String endPoint}) async {
    FormData data = FormData();
    data.files.add(
      MapEntry(
        'photo',
        await MultipartFile.fromFile(imageFile.path,
            contentType: MediaType("image", imageFile.path.split(".").last),
            filename: imageFile.path.split('.').first),
      ),
    );
    var headers = {
      'token': token,
      'Authorization': "Bearer $token",
    };
    Dio dio = dioProvider();
    var response = await dio.put('${ApiConstants.baseUrl}$endPoint',
        data: data,
        options: Options(
          method: 'PUT',
          headers: headers,
        ));
    return UpLoadImageResponse.fromJson(response.data);
  }
}

// class UploadImageApiManger2 {
//   Future<UpLoadImageResponse> uploadImage({
//     required File imageFile,
//     required String endPoint,
//
//
//     required String name,
//   }) async {
//     String  token=CacheService.getData(key: CacheConstants.userToken);
//
//     FormData data = FormData.fromMap({
//       'files': [
//         await MultipartFile.fromFile(
//           imageFile.path,
//           filename: imageFile.path.split('/').last,
//         )
//       ],
//       'name': name,
//     });
//
//
//     var headers = {
//       'token': token,
//       'Authorization':"Bearer $token",
//     };
//
//
//     Dio dio = Dio();
//
//
//     var response = await dio.request(
//       'https://flower.elevateegy.com/api/v1/vehicle/6737bf29346d8ae782f75920',
//       options: Options(
//         method: 'PUT',
//         headers: headers,
//       ),
//       data: data,
//     );
//
//     // التحقق من الاستجابة
//     if (response.statusCode == 200) {
//       return UpLoadImageResponse.fromJson(response.data);
//     } else {
//       throw Exception('Failed to upload image: ${response.statusMessage}');
//     }
//   }
// }
