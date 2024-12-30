
import '../../domain/entities/profile_data_entity.dart';
import '../../domain/repositories/profile_repo.dart';

import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/get_profile_repo.dart';

@Injectable(as:GetProfileRepo)
class GetProfileRepoImpl implements GetProfileRepo {
  GetProfileRepoImpl(this.getProfileDataSource);

  GetProfileDataSource getProfileDataSource;

  @override
  Future<Result<ProfileDataModelEntity?>> getProfile(String token)async {
    return  await getProfileDataSource.getProfile(
      token,
    );
  }
}
