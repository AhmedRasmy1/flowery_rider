import '../../../../core/common/api_result.dart';
import '../data_sources/edit_profile_data_source_repo.dart';
import '../models/request/edit_profile_request.dart';
import '../../domain/entities/profile_edit_data_entity.dart';
import '../../domain/repositories/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDataSource editProfileDataSource;

  EditProfileRepoImpl(this.editProfileDataSource);

  @override
  Future<Result<EditProfileDataEntity?>> editProfile(
    EditProfileRequest editProfileRequest,
  ) async {
    return await editProfileDataSource.editProfile(editProfileRequest);
  }
}
