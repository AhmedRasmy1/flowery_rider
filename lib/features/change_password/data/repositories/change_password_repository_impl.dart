import '../../domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/change_password_repository.dart';
import '../data_source/change_password_online_data_source.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  ChangePasswordOnlineDataSource changePasswordOnlineDataSource;

  ChangePasswordRepositoryImpl(this.changePasswordOnlineDataSource);

  @override
  Future<Result<ChangePasswordEntity?>> changePassword(
      String oldPassword, String newPassword, String rePassword, String token) {
    return changePasswordOnlineDataSource.changePassword(
        oldPassword, newPassword, rePassword, token);
  }
}
