import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/my_profile/data/models/response/profile_data_model.dart';
import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;


  @GET(ApiConstants.profile)
  Future<ProfileDataModel> getProfile(
      @Header("Authorization") String token,
      );

}
