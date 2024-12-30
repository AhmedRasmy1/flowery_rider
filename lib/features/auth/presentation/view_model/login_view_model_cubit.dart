import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;
  bool rememberMe = false; // Track if "Remember Me" is selected

  LoginViewModel(this.loginUseCases) : super(InitialState());

  Future<void> login(String email, String password) async {
    emit(LoadingLoginState());

    var result = await loginUseCases.login(email, password);

    switch (result) {
      case Success<LoginEntitie>():
        if (rememberMe && result.data.token != null) {
          await _saveToken(result.data.token!);
          await _saveRememberMe(rememberMe);
        }
        await _saveToken(result.data.token!);
        // print("===========================================");
        // print(result.data.token);
        // print("===========================================");
        // print(StringCache.userToken);

        print(result.data.token);
        emit(SuccessLoginState(result.data));
      case Fail<LoginEntitie>():
        print(result.exception);
        emit(ErrorLoginState(result.exception));

    }
  }

  Future<void> _saveToken(String token) async {
    await CacheService.setData(key: CacheConstants.userToken, value: token);
  }

  Future<void> _saveRememberMe(bool rememberMe) async {
    await CacheService.setData(
        key: CacheConstants.isRememberMe, value: rememberMe);
  }

// Future<void> logout() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.remove(CacheConstants.userToken);
// }
}
