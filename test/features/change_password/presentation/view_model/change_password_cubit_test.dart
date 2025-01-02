import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/change_password/domain/entities/change_password_entity.dart';
import 'package:flowery_rider/features/change_password/domain/use_case/change_password_use_case.dart';
import 'package:flowery_rider/features/change_password/presentation/view_model/change_password_cubit.dart';
import 'package:flowery_rider/features/change_password/presentation/view_model/change_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  group('ChangePasswordViewModel Tests', () {
    late MockChangePasswordUseCase mockChangePasswordUseCase;
    late ChangePasswordViewModel changePasswordViewModel;

    setUp(() {
      // Initialize the mock and view model
      mockChangePasswordUseCase = MockChangePasswordUseCase();
      changePasswordViewModel =
          ChangePasswordViewModel(mockChangePasswordUseCase);
    });

    blocTest<ChangePasswordViewModel, ChangePasswordState>(
      'when calling doIntent with ChangePasswordIntent, it should emit loading and success states',
      build: () {
        // Prepare a mock success result
        var changePasswordEntity = ChangePasswordEntity();
        var result = Success<ChangePasswordEntity?>(changePasswordEntity);

        when(mockChangePasswordUseCase.invoke(
          any,
          any,
          any,
          any,
        )).thenAnswer((_) async => result);

        return changePasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ChangePasswordIntent(
          oldPassword: "Old@1234",
          newPassword: "New@1234",
          rePassword: "New@1234",
          token: "Bearer token",
        ));
      },
      expect: () => [
        isA<ChangePasswordLoadingState>(), // Expect Loading state first
        isA<ChangePasswordSuccessState>(), // Then expect Success state
      ],
    );

    blocTest<ChangePasswordViewModel, ChangePasswordState>(
      'when calling doIntent with ChangePasswordIntent, it should emit loading and error states on failure',
      build: () {
        // Prepare a mock failure result
        var result =
            Fail<ChangePasswordEntity?>(Exception("Failed to change password"));

        when(mockChangePasswordUseCase.invoke(
          any,
          any,
          any,
          any,
        )).thenAnswer((_) async => result);

        return changePasswordViewModel;
      },
      act: (viewModel) {
        // Trigger the action
        viewModel.doIntent(ChangePasswordIntent(
          oldPassword: "Old@1234",
          newPassword: "New@1234",
          rePassword: "New@1234",
          token: "Bearer token",
        ));
      },
      expect: () => [
        isA<ChangePasswordLoadingState>(), // Expect Loading state first
        isA<ChangePasswordErrorState>(), // Then expect Error state
      ],
    );
  });
}
