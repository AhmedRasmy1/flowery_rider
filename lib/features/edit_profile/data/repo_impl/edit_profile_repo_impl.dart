


import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/edit_profile/data/data_sources/edit_profile_data_source_repo.dart';
import 'package:flowery_rider/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:flowery_rider/features/edit_profile/domain/entities/profile_edit_data_entity.dart';
import 'package:flowery_rider/features/edit_profile/domain/repositories/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:EditProfileRepo )
class EditProfileRepoImpl  implements EditProfileRepo {

  final EditProfileDataSource editProfileDataSource;

  EditProfileRepoImpl(this.editProfileDataSource);

  @override
  Future<Result<EditProfileDataEntity?>> editProfile(EditProfileRequest editProfileRequest,) async{
  return await editProfileDataSource.editProfile( editProfileRequest) ;
  }


}