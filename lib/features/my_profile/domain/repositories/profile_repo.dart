
import '../../../../core/common/api_result.dart';
import '../entities/profile_data_entity.dart';

abstract class GetProfileRepo {
  Future<Result<ProfileDataModelEntity?>> getProfile(
      String token,
      );
}
