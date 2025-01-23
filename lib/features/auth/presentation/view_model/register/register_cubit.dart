import 'package:dio/dio.dart';
import '../../../domain/entities/register_entity.dart';
import '../../../domain/use_cases/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/api_result.dart';
import 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(InitialState());
  bool isSelectGender = false;
  bool isSelectGender2 = false;

  Future<void> register(
    String country,
    String firstName,
    String lastName,
    String vehicleType,
    String vehicleNumber,
    MultipartFile vehicleLicense,
    String NID,
    MultipartFile NIDImg,
    String email,
    String password,
    String rePassword,
    String gender,
    String phone,
  ) async {
    emit(LoadingRegisterState());
    // String gender =
    // CacheService.getData(key: CacheConstants.selectGender) ?? '';
    print("=======================================");
    print("Fetching addresses with token:");

    var result = await _registerUseCase.register(
      country,
      firstName,
      lastName,
      vehicleType,
      vehicleNumber,
      vehicleLicense,
      NID,
      NIDImg,
      email,
      password,
      rePassword,
      gender,
      phone,
    );

    switch (result) {
      case Success<RegisterEntity>():
        print("=======================================");
        print(RegisterEntity);
        emit(SuccessRegisterState(result.data));
      case Fail<RegisterEntity>():
        emit(ErrorRegisterState(result.exception));
        print("=======================================");
        print("Error Occurred: ${result.exception}");
    }
  }
}
