import '../../../../core/common/api_result.dart';
import '../entities/login_entity.dart';
import '../entities/logout_entity.dart';

abstract class AuthRepo {
  Future<Result<LoginEntitie>> login(String name, String password);
  Future<Result<LogoutEntity>> logout(String token);
}
