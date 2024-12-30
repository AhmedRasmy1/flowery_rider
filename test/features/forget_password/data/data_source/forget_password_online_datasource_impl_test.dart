
import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/forget_password/data/data_source/forget_password_online_datasource_impl.dart';
import 'package:flowery_rider/features/forget_password/data/model/forget_password_request/reset_password_request.dart';
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/forget_password_response.dart';
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/reset_password_response.dart';
import 'package:flowery_rider/features/forget_password/data/model/forget_password_response/verify_response.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:flowery_rider/features/forget_password/domain/entities/verify_password_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late ForgetPasswordOnlineDatasourceImpl forgetPasswordOnlineDataSource;

  setUp(() {
    mockApiService = MockApiService();
    forgetPasswordOnlineDataSource =
        ForgetPasswordOnlineDatasourceImpl(mockApiService);
  });
group('test all features in forget password',(){
  test('should call forgetPassword and return Success', () async {
    // Arrange
    const email = "email@gmail.com";

    final mockForgetPasswordResponse = ForgetPasswordResponse();

    when(mockApiService.forgetPassword(any))
        .thenAnswer((_) async => mockForgetPasswordResponse);

    // Act
    final result = await forgetPasswordOnlineDataSource.forgetPassword(
        email
    );

    // Assert
    verify(mockApiService.forgetPassword(any)).called(1);
    expect(result, isA<Success<ForgetPasswordEntity?>>());
  });
  test('should call verifyPassword and return Success', () async {
    // Arrange
    const otp = "123456";

    final mockVerifyResponse = VerifyResponse();

    when(mockApiService.verifyPassword(any))
        .thenAnswer((_) async => mockVerifyResponse);

    // Act
    final result = await forgetPasswordOnlineDataSource.verifyPassword(
        otp
    );

    // Assert
    verify(mockApiService.verifyPassword(any)).called(1);
    expect(result, isA<Success<VerifyPasswordEntity?>>());
  });
  test('should call resetPassword and return Success', () async {
    // Arrange
    const email = "Old@123";
    const newPassword="New@123";
    ResetPasswordRequest request=ResetPasswordRequest(email: email,newPassword: newPassword);

    final mockResetResponse = ResetPasswordResponse();

    when(mockApiService.resetPassword(any))
        .thenAnswer((_) async => mockResetResponse);

    // Act
    final result = await forgetPasswordOnlineDataSource.resetPassword(request);

    // Assert
    verify(mockApiService.resetPassword(any)).called(1);
    expect(result, isA<Success<ResetPasswordEntity?>>());
  });
}
);

}
