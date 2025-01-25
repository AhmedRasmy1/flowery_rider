import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/entities/register_entities/register_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../models/request/login_model_dto.dart';
import '../models/request/register_request_dto.dart';
import '../models/request/register_request_dto.dart';

abstract class AuthOnLineDataSource {
  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto);
  Future<Result<LogoutEntity>> logout(String token);
  Future<Result<RegisterEntity>> signUp(RegisterRequestDto registerRequestDto);
}
