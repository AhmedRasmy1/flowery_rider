



import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:flowery_rider/features/forget_password/domain/use_case/verify_uce_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_use_case_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  test("when call invoke it should call ForgetPasswordRepository", () async {
    //arrange
    const otp="123456";

    var mockForgetPasswordRepo= MockForgetPasswordRepo();
    var verifyUseCase =
        VerifyUseCase(mockForgetPasswordRepo);
    var verifyPassword = VerifyPasswordEntity();
    var mockedResult = Success<VerifyPasswordEntity>(verifyPassword);
    //Stub
    when(mockForgetPasswordRepo.verifyPassword(otp))
        .thenAnswer((_) async => mockedResult);
    //Act

    var result = await verifyUseCase.invoke(otp);
    //assert
    verify(mockForgetPasswordRepo.verifyPassword(otp))
        .called(1);
    expect(result, mockedResult);
  });
}
