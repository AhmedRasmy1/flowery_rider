import 'package:flowery_rider/core/api/api_extentions.dart';
import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_sources.dart';
import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';
import 'package:flowery_rider/features/auth/domain/entities/register_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImp extends AuthOnlineDataSource {
  ApiService _authRetrofit;

  AuthOnlineDataSourceImp(this._authRetrofit);

  @override
  Future<Result<RegisterEntity>> signUp(RegisterRequestDto registerRequestDto) {
    {
      return executeApi(() async {
        var response = await _authRetrofit.signUp(registerRequestDto);
        return response.toRegisterEntity();
      });
    }
  }
}
