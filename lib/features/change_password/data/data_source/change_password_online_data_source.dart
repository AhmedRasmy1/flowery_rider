
import '../../../../core/common/api_result.dart';
import '../../domain/entities/change_password_entity.dart';

abstract class ChangePasswordOnlineDataSource {
  Future<Result<ChangePasswordEntity?>> changePassword(
      String oldPassword, String newPassword, String rePassword, String token);
}
