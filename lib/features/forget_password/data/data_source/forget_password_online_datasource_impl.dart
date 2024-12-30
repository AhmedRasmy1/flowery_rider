
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';

import '../../domain/entities/reset_password_entity.dart';
import '../../domain/entities/verify_password_entity.dart';
import '../model/forget_password_request/forget_password_request.dart';
import '../model/forget_password_request/reset_password_request.dart';
import '../model/forget_password_request/verify_request.dart';
import 'forget_password_online_datasource.dart';


@Injectable(as: ForgetPasswordOnlineDatasource)
class ForgetPasswordOnlineDatasourceImpl implements ForgetPasswordOnlineDatasource {
  final ApiService _authRetrofit;

  ForgetPasswordOnlineDatasourceImpl(this._authRetrofit);

  @override


  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    ForgetPasswordRequest requestEmail = ForgetPasswordRequest(email: email);
    return executeApi(() async {
      var response = await _authRetrofit.forgetPassword(requestEmail);
      return response.toForgetPasswordEntity();
    });
  }

  @override
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp) {
    VerifyRequest requestOtp = VerifyRequest(resetCode: otp);
    return executeApi(() async {
      var response = await _authRetrofit.verifyPassword(requestOtp);
      return response.toVerifyPasswordEntity();
    });
  }


  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return executeApi(() async {
      var response = await _authRetrofit.resetPassword(resetPasswordRequest);
      return response.toResetPasswordEntity();
    });
  }

}
