import 'package:flowery_rider/core/api/api_manager/api_manager.dart';
import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_source_impl.dart';
import 'package:flowery_rider/features/auth/data/models/request/login_model_dto.dart';
import 'package:flowery_rider/features/auth/data/models/response/login_response_dto.dart';
import 'package:flowery_rider/features/auth/domain/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AuthOnLineDataSourceImpl authOnLineDataSourceImpl;

  setUp(() {
    mockApiService = MockApiService();
    authOnLineDataSourceImpl = AuthOnLineDataSourceImpl(mockApiService);
  });

  test(
      'when call login function it should call '
          'api service and get login entity', () async {
    final mockResponse = LoginResponseDto();

    var loginModelDto = LoginModelDto(email: 'email', password: 'password');

    when(mockApiService.login(loginModelDto))
        .thenAnswer((_) async => mockResponse);

    var result = await authOnLineDataSourceImpl.login(loginModelDto);

    expect(result, isA<Success<LoginEntitie>>());
    // expect((result as Success<LoginEntitie>).data, mockResult);
    // expect(result, mockResult);
    verify(mockApiService.login(loginModelDto)).called(1);
  });
}
