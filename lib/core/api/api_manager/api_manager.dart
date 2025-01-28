import 'package:dio/dio.dart';
import '../../../features/home/data/response/pending__orders__response.dart';
import '../../../features/edit_profile/data/models/response/edit_profile_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/login_model_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../../../features/auth/data/models/response/logout_response.dart';
import '../../../features/change_password/data/model/change_password_request.dart';
import '../../../features/change_password/data/model/change_password_response.dart';
import '../../../features/edit_profile/data/models/request/edit_profile_request.dart';
import '../../../features/forget_password/data/model/forget_password_request/forget_password_request.dart';
import '../../../features/forget_password/data/model/forget_password_request/reset_password_request.dart';
import '../../../features/forget_password/data/model/forget_password_request/verify_request.dart';
import '../../../features/forget_password/data/model/forget_password_response/forget_password_response.dart';
import '../../../features/forget_password/data/model/forget_password_response/reset_password_response.dart';
import '../../../features/forget_password/data/model/forget_password_response/verify_response.dart';
import '../../../features/get_all_vehicles/data/models/vehicles_response_dto.dart';
import '../../../features/my_profile/data/models/response/profile_data_model.dart';
import '../../../features/order_details/data/models/request/update_order_request.dart';
import '../../../features/order_details/data/models/response/start_order_model.dart';
import '../../../features/order_details/data/models/response/update_order_state_response.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginModelDto loginModelDto);

  @GET(ApiConstants.logoutRoute)
  Future<LogoutResponseDto> logout(@Header("Authorization") String token);

  @GET(ApiConstants.getAllVehiclesRoute)
  Future<VehiclesResponseDto> getAllVehicles();

  @GET(ApiConstants.profile)
  Future<ProfileDataModel> getProfile(
    @Header("Authorization") String token,
  );

  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponse> editProfile(@Header("Authorization") String token,
      @Body() EditProfileRequest editProfileRequest);

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


  @GET(ApiConstants.getPendingDriverOrdersRoute)
  Future<PendingOrdersResponse> getHomeData(
      @Header("Authorization") String token);

  @PUT('${ApiConstants.startOrder}/{orderId}')
  Future<StartOrderModel?> startOrder(
      @Path() String orderId, @Header("Authorization") String token);

  @PUT('${ApiConstants.updateOrder}/{orderId}')
  Future<UpdateOrderStateResponse?> updateOrder(
      @Path()String orderId,
      @Body() UpdateOrderRequest updateOrderRequest, @Header("Authorization") String token);
}
