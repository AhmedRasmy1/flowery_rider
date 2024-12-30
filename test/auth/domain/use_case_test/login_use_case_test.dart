
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/domain/entities/login_entity.dart';
import 'package:flowery_rider/features/auth/domain/repositories/auth_repo.dart';
import 'package:flowery_rider/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo authRepo;
  late LoginUseCases loginUseCases;

  setUp(() {
    authRepo = MockAuthRepo();
    loginUseCases = LoginUseCases(authRepo);
  });

  test(
      "when call login function it should calls login.repo "
          "with correct parameters email and password", () async {
    String email = 'email';
    String password = 'password';

    var mockedResult = Success(LoginEntitie());

    when(authRepo.login(email, password)).thenAnswer((_) async => mockedResult);
    var result = await loginUseCases.login(email, password);

    expect(result, mockedResult);
    verify(authRepo.login(email, password)).called(1);
  });
}
