

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/profile_data_entity.dart';
import 'get_profile_repo.dart';

@Injectable(as:GetProfileDataSource)
class GetProfileDataSourceImpl implements GetProfileDataSource {
  ApiService apiService;
  GetProfileDataSourceImpl(this.apiService);


  @override
  Future<Result<ProfileDataModelEntity?>> getProfile(String token) {
    return executeApi(() async {
      var response = await apiService.getProfile(
          token,
        // "Bearer $cachedToken",
      );
      var data = response.toProfileDataModelEntity();
      return data;
    });
  }
}
