
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_use_case_test.mocks.dart';



@GenerateMocks([ForgetPasswordRepo])
void main() {
  test("when call invoke it should call ForgetPasswordRepository", () async {
    //arrange
    const email="email@gmail.com";

    var mockForgetPasswordRepo= MockForgetPasswordRepo();
    var forgetPasswordUseCase =
        ForgetPasswordUseCase(mockForgetPasswordRepo);
    var forgetPassword = ForgetPasswordEntity();
    var mockedResult = Success<ForgetPasswordEntity>(forgetPassword);
    //Stub
    when(mockForgetPasswordRepo.forgetPassword(email))
        .thenAnswer((_) async => mockedResult);
    //Act

    var result = await forgetPasswordUseCase.invoke(email);
    //assert
    verify(mockForgetPasswordRepo.forgetPassword(email))
        .called(1);
    expect(result, mockedResult);
  });
}
