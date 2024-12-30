import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/my_profile/data/models/response/profile_data_model.dart';
import '../../../features/change_password/data/model/change_password_request.dart';
import '../../../features/change_password/data/model/change_password_response.dart';
import '../../../features/forget_password/data/model/forget_password_request/forget_password_request.dart';
import '../../../features/forget_password/data/model/forget_password_request/reset_password_request.dart';
import '../../../features/forget_password/data/model/forget_password_request/verify_request.dart';
import '../../../features/forget_password/data/model/forget_password_response/forget_password_response.dart';
import '../../../features/forget_password/data/model/forget_password_response/reset_password_response.dart';
import '../../../features/forget_password/data/model/forget_password_response/verify_response.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.profile)
  Future<ProfileDataModel> getProfile(
    @Header("Authorization") String token,
  );

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest requestEmail);

  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResponse> verifyPassword(@Body() VerifyRequest requestOtp);

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest requestOtp);

  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponse> changePassword(
      @Body() ChangePasswordRequest changePasswordRequest,
      @Header("Authorization") String token);
}
