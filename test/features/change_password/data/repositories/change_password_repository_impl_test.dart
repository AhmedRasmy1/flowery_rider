
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/change_password/data/data_source/change_password_online_data_source.dart';
import 'package:flowery_rider/features/change_password/data/repositories/change_password_repository_impl.dart';
import 'package:flowery_rider/features/change_password/domain/entities/change_password_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_repository_impl_test.mocks.dart';

@GenerateMocks([ChangePasswordOnlineDataSource])
void main() {
  test(
      'when call ChangePasswordRepository it should call it from online data source for change password',
      () async {
    const oldPassword = "Old@1234";
    const newPassword = "New@1234";
    const rePassword = "New@1234";
    const token = "Bearer token";

    var mockChangePasswordOnLineDataSource =
        MockChangePasswordOnlineDataSource();
    var changePasswordRepository =
        ChangePasswordRepositoryImpl(mockChangePasswordOnLineDataSource);

    var changePassword = ChangePasswordEntity();
    var mockedResult = Success<ChangePasswordEntity>(changePassword);
    //Stub
    when(mockChangePasswordOnLineDataSource.changePassword(
            oldPassword, newPassword, rePassword, token))
        .thenAnswer((_) async => mockedResult);
    //Act
    var result = await changePasswordRepository.changePassword(
        oldPassword, newPassword, rePassword, token);
    //assert
    verify(mockChangePasswordOnLineDataSource.changePassword(
            oldPassword, newPassword, rePassword, token))
        .called(1);
    expect(result, mockedResult);
  });
}
