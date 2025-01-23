import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities/register_entity.dart';
import '../models/request/register_request_dto.dart';

abstract class RegisterOnlineDataSource {

  Future<Result<RegisterEntity?>> signUp(RegisterRequestDto registerRequestDto);
}