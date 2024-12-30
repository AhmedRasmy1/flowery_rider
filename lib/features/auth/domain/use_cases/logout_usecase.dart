import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/logout_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class LogoutUseCases {
  AuthRepo authRepo;

  LogoutUseCases(this.authRepo);

  Future<Result<LogoutEntity>> logout(
      String token,
      ) {
    return authRepo.logout(token);
  }
}
