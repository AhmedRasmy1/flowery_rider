import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/forget_password_view_model/forget_password_cubit.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/forget_password_view_model/forget_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_cubit_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase])
void main() {
  group('ChangePasswordViewModel Tests', () {
    late MockForgetPasswordUseCase mockForgetPasswordUseCase;
    late ForgetPasswordViewModel forgetPasswordViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockForgetPasswordUseCase = MockForgetPasswordUseCase();
      forgetPasswordViewModel =
          ForgetPasswordViewModel(mockForgetPasswordUseCase);
    });

    blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
      'when calling doIntent with ForgetPasswordIntent, it should emit loading and success states',
      build: () {
        // Prepare a mock success result
        var forgetPasswordEntity = ForgetPasswordEntity();
        var result = Success<ForgetPasswordEntity?>(forgetPasswordEntity);

        when(mockForgetPasswordUseCase.invoke(
          any,
        )).thenAnswer((_) async => result);

        return forgetPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ForgetPasswordIntent(
          "email@gmail.com"
        ));
      },
      expect: () => [
        isA<LoadingForgetPasswordState>(), // Expect Loading state first
        isA<SuccessForgetPasswordState>(), // Then expect Success state
      ],
    );

    blocTest<ForgetPasswordViewModel, ForgetPasswordState>(
      'when calling doIntent with ForgetPasswordIntent, it should emit loading and error states on failure',
      build: () {
        // Prepare a mock failure result
        var result =
            Fail<ForgetPasswordEntity?>(Exception("use  valid email"));

        when(mockForgetPasswordUseCase.invoke(
          any,
        )).thenAnswer((_) async => result);

        return forgetPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ForgetPasswordIntent(
          "email@gmail.com"
        ));
      },
      expect: () => [
        isA<LoadingForgetPasswordState>(), // Expect Loading state first
        isA<ErrorForgetPasswordState>(), // Then expect Error state
      ],
    );
  });
}
