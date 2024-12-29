import 'package:bloc/bloc.dart';
import '../../domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/use_case/change_password_use_case.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;
  //                        start state
  ChangePasswordViewModel(this.changePasswordUseCase)
      : super(ChangePasswordInitialState());

  void doIntent(ChangePasswordScreenIntent intent) {
    switch (intent) {
      case ChangePasswordIntent():
        _changePassword(intent);
    }
  }

  void _changePassword(ChangePasswordIntent intent) async {
    emit(ChangePasswordLoadingState());

    var result = await changePasswordUseCase.invoke(intent.oldPassword,
        intent.newPassword, intent.rePassword, intent.token);
    switch (result) {
      case Success<ChangePasswordEntity?>():
        {
          emit(ChangePasswordSuccessState(result.data));
        }
      case Fail<ChangePasswordEntity?>():
        {
          emit(ChangePasswordErrorState(result.exception));
        }
    }
  }
}

sealed class ChangePasswordScreenIntent {}

class ChangePasswordIntent extends ChangePasswordScreenIntent {
  String oldPassword;
  String newPassword;
  String rePassword;
  String token;

  ChangePasswordIntent({
    required this.oldPassword,
    required this.newPassword,
    required this.rePassword,
    required this.token,
  });
}
