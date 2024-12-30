
import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_source_impl.dart';
import 'package:flowery_rider/features/auth/data/models/response/logout_response.dart';
import 'package:flowery_rider/features/auth/domain/entities/logout_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AuthOnLineDataSourceImpl authOnLineDataSource;
  setUp(() {
    mockApiService = MockApiService();
    authOnLineDataSource = AuthOnLineDataSourceImpl(mockApiService);
  });

  test(
      'when call logout function it should call '
          'api service to send token and get success massage', () async {
    var mockedResult = LogoutResponseDto();

    String token = 'token';

    when(mockApiService.logout(token)).thenAnswer((_) async => mockedResult);

    var result = await authOnLineDataSource.logout(token);
    expect(result, isA<Success<LogoutEntity>>());
    verify(mockApiService.logout(token)).called(1);
  });
}
