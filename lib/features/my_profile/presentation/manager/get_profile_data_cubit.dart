import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flowery_rider/core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/profile_data_entity.dart';
import '../../domain/use_cases/profile_usecase.dart';
part 'get_profile_data_state.dart';


@injectable
class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit(this._getProfileUseCase) : super(GetProfileDataInitial());
  final GetProfileUseCase _getProfileUseCase;

  Future<void> getProfileData(String token) async {
    emit(LoadingGetProfileDataState());

    var result = await _getProfileUseCase.getProfile('Bearer $token');
    switch (result) {
      case Success<ProfileDataModelEntity?>():
        if (!isClosed) {
          log('Success');
          CacheService.setData(key: CacheConstants.firstName, value: result.data?.driver?.firstName);
          CacheService.setData(key: CacheConstants.lastName, value: result.data?.driver?.lastName);
          CacheService.setData(key: CacheConstants.email, value: result.data?.driver?.email);
          CacheService.setData(key: CacheConstants.phone, value:result.data?.driver?.phone);
          CacheService.setData(key: CacheConstants.gender, value: result.data?.driver?.gender);
          CacheService.setData(key: CacheConstants.urlImage, value: result.data?.driver?.nIDImg);
          CacheService.setData(key: CacheConstants.vehicleNumber, value: result.data?.driver?.vehicleNumber);
          CacheService.setData(key: CacheConstants.vehicleLicense, value: result.data?.driver?.vehicleLicense);
          CacheService.setData(key: CacheConstants.vehicleType, value: result.data?.driver?.vehicleType);

          emit(SuccessGetProfileDataState(result.data));
        }
      case Fail<ProfileDataModelEntity?>():
        if (isClosed) return;
        log(result.exception.toString());
        log('Fail');
        emit(ErrorGetProfileDataState(result.exception));
    }
  }
}
