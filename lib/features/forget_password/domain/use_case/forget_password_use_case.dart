import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/forget_password_entity.dart';
import '../repositories/forget_password_repo.dart';


@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordUseCase(this.forgetPasswordRepo);

  Future<Result<ForgetPasswordEntity?>> invoke(String email) {
    return forgetPasswordRepo.forgetPassword(email);
  }
}
