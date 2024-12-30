

import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flowery_rider/features/auth/domain/entities/login_entity.dart';
import 'package:flowery_rider/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flowery_rider/features/auth/presentation/view_model/login_state.dart';
import 'package:flowery_rider/features/auth/presentation/view_model/login_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([LoginUseCases])
void main() {
  late LoginViewModel loginViewModel;
  late LoginUseCases mockLoginUseCases;

  setUp(() async {
    SharedPreferences.setMockInitialValues(
        {CacheConstants.userToken: 'fakeToken'});
    final sharedPreferences = await SharedPreferences.getInstance();
    CacheService.sharedPreferences = sharedPreferences;
    mockLoginUseCases = MockLoginUseCases();
    loginViewModel = LoginViewModel(mockLoginUseCases);
  });

  blocTest<LoginViewModel, LoginState>(
    'Ensure login emits [LoginLoading, LoginSuccess] when the use case succeeds.',
    build: () {
      var mockedResult = Success<LoginEntitie>(
        LoginEntitie(
          message: 'Fake message',
          token: 'Fake token',
        ),
      );
      when(mockLoginUseCases.login(
        'Fake_email',
        'Fake_password',
      )).thenAnswer((_) async => mockedResult);

      return loginViewModel;
    },
    act: (loginViewModel) => loginViewModel.login(
      'Fake_email',
      'Fake_password',
    ),
    expect: () => [
      isA<LoadingLoginState>(),
      isA<SuccessLoginState>(),
    ],
    verify: (_) {
      verify(mockLoginUseCases.login(
        'Fake_email',
        'Fake_password',
      )).called(1);
    },
  );

  blocTest<LoginViewModel, LoginState>(
    'Ensure login emits [LoginLoading, LoginFail] when the use case fails.',
    build: () {
      var mockedResult = Fail<LoginEntitie>(Exception('Error'));
      when(mockLoginUseCases.login(
        'Fake_email',
        'Fake_password',
      )).thenAnswer((_) async => mockedResult);

      return loginViewModel;
    },
    act: (loginViewModel) => loginViewModel.login(
      'Fake_email',
      'Fake_password',
    ),
    expect: () => [
      isA<LoadingLoginState>(),
      isA<ErrorLoginState>(),
    ],
    verify: (_) {
      verify(mockLoginUseCases.login(
        'Fake_email',
        'Fake_password',
      )).called(1);
    },
  );
}
