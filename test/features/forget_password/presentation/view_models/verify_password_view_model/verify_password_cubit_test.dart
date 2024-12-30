


import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/verify_uce_case.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/verify_password_view_model/verify_password_cubit.dart';
import 'package:flowery_rider/features/forget_password/presentation/view_models/verify_password_view_model/verify_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_password_cubit_test.mocks.dart';

@GenerateMocks([VerifyUseCase])
void main() {
  group('VerifyPasswordViewModel Tests', () {
    late MockVerifyUseCase mockVerifyUseCase;
    late VerifyPasswordViewModel verifyPasswordViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockVerifyUseCase = MockVerifyUseCase();
      verifyPasswordViewModel =
          VerifyPasswordViewModel(mockVerifyUseCase);
    });

    blocTest<VerifyPasswordViewModel, VerifyPasswordState>(
      'when calling doIntent with ForgetPasswordIntent, it should emit loading and success states',
      build: () {
        // Prepare a mock success result
        var verifyPasswordEntity = VerifyPasswordEntity();
        var result = Success<VerifyPasswordEntity?>(verifyPasswordEntity);

        when(mockVerifyUseCase.invoke(
          any,
        )).thenAnswer((_) async => result);

        return verifyPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(VerifyPasswordIntent(
          "123456"
        ));
      },
      expect: () => [
        isA<LoadingVerifyPasswordState>(), // Expect Loading state first
        isA<SuccessVerifyPasswordState>(), // Then expect Success state
      ],
    );

    blocTest<VerifyPasswordViewModel, VerifyPasswordState>(
      'when calling doIntent with VerifyPasswordIntent, it should emit loading and error states on failure',
      build: () {
        // Prepare a mock failure result
        var result =
            Fail<VerifyPasswordEntity?>(Exception("use right otp"));

        when(mockVerifyUseCase.invoke(
          any,
        )).thenAnswer((_) async => result);

        return verifyPasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(VerifyPasswordIntent(
          "123456"
        ));
      },
      expect: () => [
        isA<LoadingVerifyPasswordState>(), // Expect Loading state first
        isA<ErrorVerifyPasswordState>(), // Then expect Error state
      ],
    );
  });
}
