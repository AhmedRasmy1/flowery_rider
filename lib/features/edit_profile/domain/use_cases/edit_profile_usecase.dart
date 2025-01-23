import '../repositories/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_profile_request.dart';
import '../entities/profile_edit_data_entity.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo editProfileRepo;

  EditProfileUseCase(this.editProfileRepo);

  Future<Result<EditProfileDataEntity?>> editProfile(
    EditProfileRequest editProfileRequest,
  ) async {
    return await editProfileRepo.editProfile(editProfileRequest);
  }
}
