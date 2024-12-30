import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_source.dart';
import 'package:flowery_rider/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:flowery_rider/features/auth/domain/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repo_impl_test.mocks.dart';

@GenerateMocks([AuthOnLineDataSource])
void main() {
  late MockAuthOnLineDataSource mockAuthOnLineDataSource;
  late AuthRepoImpl authRepo;

  setUp(() {
    mockAuthOnLineDataSource = MockAuthOnLineDataSource();
    authRepo = AuthRepoImpl(mockAuthOnLineDataSource);
  });

  test('should call online datasource login using any matcher', () async {
    String email = 'email';
    String password = 'password';

    //var loginDto = LoginModelDto(email: email, password: password);

    var mockedResult = Success(LoginEntitie());

    when(mockAuthOnLineDataSource.login(any))
        .thenAnswer((_) async => mockedResult);

    var result = await authRepo.login(email, password);
    expect(result, mockedResult);

    verify(mockAuthOnLineDataSource.login(any)).called(1);
  });
}
