import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../models/request/login_model_dto.dart';
import 'auth_online_data_source.dart';

@Injectable(as: AuthOnLineDataSource)
class AuthOnLineDataSourceImpl implements AuthOnLineDataSource {
  final ApiService _authRetrofit;

  AuthOnLineDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto) {
    return executeApi(() async {
      var response = await _authRetrofit.login(loginModelDto);

      return response.toLoginEntities();
    });
  }

  @override
  Future<Result<LogoutEntity>> logout(String token) {
    return executeApi(() async {
      var response = await _authRetrofit.logout(token);
      return response.toLogoutEntity();
    });
  }

}
