

import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
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
      String token=CacheService.getData(key: CacheConstants.userToken);
      var response = await apiService.getProfile(

         "Bearer $token",
      );
      var data = response.toProfileDataModelEntity();
      return data;
    });
  }
}
