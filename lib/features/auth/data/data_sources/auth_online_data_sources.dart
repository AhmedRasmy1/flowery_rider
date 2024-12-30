import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';
import 'package:flowery_rider/features/auth/domain/entities/register_entity.dart';

abstract class AuthOnlineDataSource {
  Future<Result<RegisterEntity>> signUp(RegisterRequestDto registerRequestDto);
}
