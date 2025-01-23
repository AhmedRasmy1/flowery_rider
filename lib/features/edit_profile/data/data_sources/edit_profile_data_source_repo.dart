import '../../domain/entities/profile_edit_data_entity.dart';

import '../../../../core/common/api_result.dart';
import '../models/request/edit_profile_request.dart';

abstract class EditProfileDataSource {
  Future<Result<EditProfileDataEntity?>> editProfile(
      EditProfileRequest editProfileRequest);
}
