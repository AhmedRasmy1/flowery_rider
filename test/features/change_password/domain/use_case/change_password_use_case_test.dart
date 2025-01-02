
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/change_password/domain/entities/change_password_entity.dart';
import 'package:flowery_rider/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:flowery_rider/features/change_password/domain/use_case/change_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ChangePasswordRepository])
void main() {
  test("when call invoke it should call ChangePasswordRepository", () async {
    //arrange
    const oldPassword = "Old@1234";
    const newPassword = "New@1234";
    const rePassword = "New@1234";
    const token = "Bearer token";

    var mockChangePasswordRepository = MockChangePasswordRepository();
    var changePasswordUseCase =
        ChangePasswordUseCase(mockChangePasswordRepository);
    var changePassword = ChangePasswordEntity();
    var mockedResult = Success<ChangePasswordEntity>(changePassword);
    //Stub
    when(mockChangePasswordRepository.changePassword(
            oldPassword, newPassword, rePassword, token))
        .thenAnswer((_) async => mockedResult);
    //Act

    var result = await changePasswordUseCase.invoke(
        oldPassword, newPassword, rePassword, token);
    //assert
    verify(mockChangePasswordRepository.changePassword(
            oldPassword, newPassword, rePassword, token))
        .called(1);
    expect(result, mockedResult);
  });
}
