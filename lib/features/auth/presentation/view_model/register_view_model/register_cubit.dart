import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/api_result.dart';
import '../../../domain/entities/register_entities/register_entity.dart';
import '../../../domain/use_cases/register_use_case.dart';
import 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  // static RegisterViewModel get(context) => BlocProvider.of(context);

  RegisterViewModel(this._registerUseCase) : super(InitialState());
  bool isSelectGender = false;
  bool isSelectGender2 = false;

  void doIntent(RegisterAction intent) async {
    switch (intent) {
      case RegisterAction():
        _register(intent);
    }
  }

  void _register(RegisterAction registerAction) async {
    emit(LoadingRegisterState());
    String gender =
        CacheService.getData(key: CacheConstants.selectGender) ?? '';
    var result = await _registerUseCase.register(
      registerAction.country,
      registerAction.firstName,
      registerAction.lastName,
      registerAction.vehicleType,
      registerAction.vehicleNumber,
      registerAction.vehicleLicense,
      registerAction.nid,
      registerAction.nidImg,
      registerAction.email,
      registerAction.password,
      registerAction.rePassword,
      gender,
      registerAction.phone,
    );

    switch (result) {
      case Success<RegisterEntity?>():
        emit(SuccessRegisterState(result.data));
      case Fail<RegisterEntity?>():
         print(result.exception);
        emit(ErrorRegisterState(result.exception));
    }
  }
}
