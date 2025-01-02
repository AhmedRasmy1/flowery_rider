import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/reset_password_usecase.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/reset_password_view_model/reset_password_cubit.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/reset_password_view_model/reset_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_cubit_test.mocks.dart';


@GenerateMocks([ResetPasswordUseCase])
void main() {
  group('ResetPasswordViewModel Tests', () {
    late MockResetPasswordUseCase mockResetPasswordUseCase;
    late ResetPasswordViewModel resetPasswordViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockResetPasswordUseCase = MockResetPasswordUseCase();
      resetPasswordViewModel =
          ResetPasswordViewModel(mockResetPasswordUseCase);
    });

    blocTest<ResetPasswordViewModel, ResetPasswordState>(
      'when calling doIntent with ResetPasswordIntent, it should emit loading and success states',
      build: () {
        // Prepare a mock success result
        var resetPasswordEntity = ResetPasswordEntity();
        var result = Success<ResetPasswordEntity?>(resetPasswordEntity);

        when(mockResetPasswordUseCase.invoke(
          any,any
        )).thenAnswer((_) async => result);

        return resetPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ResetPasswordIntent(
          "email@gmail.com","New@123"
        ));
      },
      expect: () => [
        isA<LoadingResetPasswordState>(), // Expect Loading state first
        isA<SuccessResetPasswordState>(), // Then expect Success state
      ],
    );

    blocTest<ResetPasswordViewModel, ResetPasswordState>(
      'when calling doIntent with ResetPasswordIntent, it should emit loading and error states on failure',
      build: () {
        // Prepare a mock failure result
        var result =
            Fail<ResetPasswordEntity?>(Exception("use valid email and password"));

        when(mockResetPasswordUseCase.invoke(
          any,any
        )).thenAnswer((_) async => result);

        return resetPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ResetPasswordIntent(
          "email@gmail.com","New@123"
        ));
      },
      expect: () => [
        isA<LoadingResetPasswordState>(), // Expect Loading state first
        isA<ErrorResetPasswordState>(), // Then expect Error state
      ],
    );
  });
}
