import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flowery_rider/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:flowery_rider/features/edit_profile/domain/entities/profile_edit_data_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../domain/use_cases/edit_profile_usecase.dart';

part 'edit_profile_state.dart';
@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitial());

  final EditProfileUseCase _editProfileUseCase;

  Future<void> editProfileData(
    String phone,
    String firstName,
    String email,
    String lastName,
  ) async {
    var result = await _editProfileUseCase.editProfile(EditProfileRequest(
      phone: phone,
      firstName: firstName,
      email: email,
      lastName: lastName,
    ));
    switch (result) {
      case Success<EditProfileDataEntity?>():
        if (!isClosed) {
          log('Success');
          CacheService.setData(key: CacheConstants.firstName,
              value: result.data?.driver?.firstName);
          CacheService.setData(key: CacheConstants.lastName,
              value: result.data?.driver?.lastName);
          CacheService.setData(
              key: CacheConstants.email, value: result.data?.driver?.email);
          CacheService.setData(
              key: CacheConstants.phone, value: result.data?.driver?.phone);
          // CacheService.setData(
          //     key: CacheConstants.gender, value: result.data?.driver?.gender);
          // CacheService.setData(
          //     key: CacheConstants.urlImage, value: result.data?.driver?.nIDImg);
          // CacheService.setData(key: CacheConstants.vehicleNumber,
          //     value: result.data?.driver?.vehicleNumber);
          // CacheService.setData(key: CacheConstants.vehicleLicense,
          //     value: result.data?.driver?.vehicleLicense);
          // CacheService.setData(key: CacheConstants.vehicleType,
          //     value: result.data?.driver?.vehicleType);

          emit(SuccessEditProfileState(result.data));
        }
      case Fail<EditProfileDataEntity?>():
        if (isClosed) return;
        log(result.exception.toString());
        log('Fail');
        emit(ErrorEditProfileState(result.exception));
    }
  }
}
