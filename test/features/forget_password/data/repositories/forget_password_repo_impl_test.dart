
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/data/data_source/forget_password_online_datasource.dart';
import 'package:flowery_rider/features/forget_password/data/repositories/forget_password_repo_impl.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_repo_impl_test.mocks.dart';


@GenerateMocks([ForgetPasswordOnlineDatasource])
void main() {

  const email ="email";
  const otp='123456';
  const newPassword="New@123";
  var mockForgetPasswordOnLineDataSource =
  MockForgetPasswordOnlineDatasource();
  var forgetPasswordRepo =
  ForgetPasswordRepoImpl(mockForgetPasswordOnLineDataSource);


    group('test all functions in forgetPasswordRepo', (){
      test('when call ForgetPassword it should call it from online data source for forget password',() async {
        var forgetPassword = ForgetPasswordEntity();
        var mockedResult = Success<ForgetPasswordEntity>(forgetPassword);
        //Stub
        when(mockForgetPasswordOnLineDataSource.forgetPassword(email))
            .thenAnswer((_) async => mockedResult);
        //Act
        var result = await forgetPasswordRepo.forgetPassword(email);
        //assert
        verify(mockForgetPasswordOnLineDataSource.forgetPassword(email))
            .called(1);
        expect(result, mockedResult);
      });
      test('when call verifyPassword it should call it from online data source for verify password',() async {
        var verifyPassword = VerifyPasswordEntity();
        var mockedResult = Success<VerifyPasswordEntity>(verifyPassword);
        //Stub
        when(mockForgetPasswordOnLineDataSource.verifyPassword(otp))
            .thenAnswer((_) async => mockedResult);
        //Act
        var result = await forgetPasswordRepo.verifyPassword(otp);
        //assert
        verify(mockForgetPasswordOnLineDataSource.verifyPassword(otp))
            .called(1);
        expect(result, mockedResult);
      });
      test('when call resetPassword it should call it from online data source for reset password',() async {
        var resetPassword = ResetPasswordEntity();
        var mockedResult = Success<ResetPasswordEntity>(resetPassword);
        //Stub
        when(mockForgetPasswordOnLineDataSource.resetPassword(any))
            .thenAnswer((_) async => mockedResult);
        //Act
        var result = await forgetPasswordRepo.resetPassword(email,newPassword);
        //assert
        verify(mockForgetPasswordOnLineDataSource.resetPassword(any))
            .called(1);
        expect(result, mockedResult);
      });
    });



}
