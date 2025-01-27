import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../models/request/login_model_dto.dart';


abstract class AuthOnLineDataSource {
  Future<Result<LoginEntitie>> login(LoginModelDto loginModelDto);
  Future<Result<LogoutEntity>> logout(String token);

}
