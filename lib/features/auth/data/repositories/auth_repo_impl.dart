
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_online_data_source.dart';
import '../models/request/login_model_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<LoginEntitie>> login(String email, String password) {
    return onLineDataSource.login(LoginModelDto(
      email: email,
      password: password,
    ));
  }

  @override
  Future<Result<LogoutEntity>> logout(String token) {
    return onLineDataSource.logout(token);
  }



}
