

import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/profile_data_entity.dart';
import '../repositories/profile_repo.dart';

@injectable
class GetProfileUseCase {
  final GetProfileRepo getProfileRepo;

  GetProfileUseCase(this.getProfileRepo);

  Future<Result<ProfileDataModelEntity?>> getProfile(String token) async{
    return await getProfileRepo.getProfile(
      token,
    );
  }
}
