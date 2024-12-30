import '../../../../core/common/api_result.dart';
import '../../domain/entities/profile_data_entity.dart';

abstract class GetProfileDataSource {
  Future<Result<ProfileDataModelEntity?>> getProfile(
    String token,
  );
}
