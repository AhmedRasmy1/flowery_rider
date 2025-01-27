import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/change_password/data/data_source/change_password_online_data_source_impl.dart';
import 'package:flowery_rider/features/change_password/data/model/change_password_response.dart';
import 'package:flowery_rider/features/change_password/domain/entities/change_password_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/data_source/login_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late ChangePasswordOnlineDataSourceImpl changePasswordOnlineDataSource;

  setUp(() {
    mockApiService = MockApiService();
    changePasswordOnlineDataSource =
        ChangePasswordOnlineDataSourceImpl(mockApiService);
  });

  test('should call changePassword and return Success', () async {
    // Arrange
    const oldPassword = "Old@1234";
    const newPassword = "New@1234";
    const rePassword = "New@1234";
    const token = "Bearer token";
    final mockChangePasswordResponse = ChangePasswordResponse();

    when(mockApiService.changePassword(any, token))
        .thenAnswer((_) async => mockChangePasswordResponse);

    // Act
    final result = await changePasswordOnlineDataSource.changePassword(
      oldPassword,
      newPassword,
      rePassword,
      token,
    );

    // Assert
    verify(mockApiService.changePassword(any, token)).called(1);
    expect(result, isA<Success<ChangePasswordEntity?>>());
  });
}
