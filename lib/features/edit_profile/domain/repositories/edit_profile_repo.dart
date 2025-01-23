import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_profile_request.dart';
import '../entities/profile_edit_data_entity.dart';

abstract class EditProfileRepo {
  Future<Result<EditProfileDataEntity?>> editProfile(
    EditProfileRequest editProfileRequest,
  );
}
