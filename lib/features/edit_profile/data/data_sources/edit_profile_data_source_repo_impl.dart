import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:flowery_rider/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:flowery_rider/features/edit_profile/domain/entities/profile_edit_data_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'edit_profile_data_source_repo.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImpl implements EditProfileDataSource {
  ApiService apiService;

  EditProfileDataSourceImpl(this.apiService);

  @override
  Future<Result<EditProfileDataEntity?>> editProfile(
      EditProfileRequest editProfileRequest) {
    return executeApi(() async {
      String token = CacheService.getData(key: CacheConstants.userToken);
      var response =
          await apiService.editProfile("Bearer $token", editProfileRequest);
      var data = response.editProfileDataModelEntity();
      return data;
    });
  }
}
