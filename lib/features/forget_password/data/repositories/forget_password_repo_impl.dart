import '../data_source/forget_password_online_datasource.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/verify_password_entity.dart';
import '../../domain/repositories/forget_password_repo.dart';
import '../model/forget_password_request/reset_password_request.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/reset_password_entity.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  ForgetPasswordOnlineDatasource onLineDataSource;

  ForgetPasswordRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    return onLineDataSource.forgetPassword(email);
  }

  @override
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp) {
    return onLineDataSource.verifyPassword(otp);
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) {
    return onLineDataSource.resetPassword(
        ResetPasswordRequest(email: email, newPassword: newPassword));
  }
}
