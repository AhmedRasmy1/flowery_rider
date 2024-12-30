import '../model/change_password_request.dart';
import '../../domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'change_password_online_data_source.dart';

@Injectable(as: ChangePasswordOnlineDataSource)
class ChangePasswordOnlineDataSourceImpl
    implements ChangePasswordOnlineDataSource {
  final ApiService _homeRetrofit;

  ChangePasswordOnlineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<ChangePasswordEntity?>> changePassword(String oldPassword,
      String newPassword, String rePassword, String token) async {
    return executeApi(() async {
      ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
          password: oldPassword, newPassword: newPassword);

      var response =
          await _homeRetrofit.changePassword(changePasswordRequest, token);

      return response.toChangePasswordEntity();
    });
  }
}
