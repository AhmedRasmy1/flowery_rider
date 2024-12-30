import '../entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../repositories/change_password_repository.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordRepository changePasswordRepository;
  ChangePasswordUseCase(this.changePasswordRepository);

  Future<Result<ChangePasswordEntity?>> invoke(
      String oldPassword, String newPassword, String rePassword, String token) {
    return changePasswordRepository.changePassword(
        oldPassword, newPassword, rePassword, token);
  }
}
