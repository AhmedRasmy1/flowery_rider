import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/login_model_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../../../features/auth/data/models/response/logout_response.dart';
import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;


  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginModelDto loginModelDto);



  @GET(ApiConstants.logoutRoute)
  Future<LogoutResponseDto> logout(@Header("Authorization") String token);

  // @POST(ApiConstants.signupRoute)
  // Future<RegisterResponseDto> signUp(@Body() RegisterModelDto registerModelDto);


}
