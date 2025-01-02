



import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/reset_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  test("when call invoke it should call ForgetPasswordRepository", () async {
    //arrange
    const email="email@gmail.com";
    const newPassword="New@123";

    var mockForgetPasswordRepo= MockForgetPasswordRepo();
    var resetPasswordUseCase =
        ResetPasswordUseCase(mockForgetPasswordRepo);
    var resetPassword = ResetPasswordEntity();
    var mockedResult = Success<ResetPasswordEntity>(resetPassword);
    //Stub
    when(mockForgetPasswordRepo.resetPassword(email,newPassword))
        .thenAnswer((_) async => mockedResult);
    //Act

    var result = await resetPasswordUseCase.invoke(email,newPassword);
    //assert
    verify(mockForgetPasswordRepo.resetPassword(email,newPassword))
        .called(1);
    expect(result, mockedResult);
  });
}
