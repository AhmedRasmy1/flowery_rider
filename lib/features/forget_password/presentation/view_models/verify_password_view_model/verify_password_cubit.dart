import 'dart:developer';
import '../../../domain/use_case/verify_uce_case.dart';
import 'verify_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/verify_password_entity.dart';


@injectable
class VerifyPasswordViewModel extends Cubit<VerifyPasswordState> {
  VerifyUseCase verifyUseCase;
  VerifyPasswordViewModel(this.verifyUseCase) : super(InitialState());

  void doIntent(VerifyPasswordScreenIntent intent) {
    switch (intent) {
      case VerifyPasswordIntent():
        _verifyPassword(intent);
    }
  }

  void _verifyPassword(VerifyPasswordIntent intent) async {
    emit(LoadingVerifyPasswordState());

    var result = await verifyUseCase.invoke(intent.otp);
    var testOtp = intent.otp;
    log(testOtp);
    switch (result) {
      case Success<VerifyPasswordEntity?>():
        emit(SuccessVerifyPasswordState(result.data));
      case Fail<VerifyPasswordEntity?>():
        emit(ErrorVerifyPasswordState(result.exception));
    }
  }
}

sealed class VerifyPasswordScreenIntent {}

class VerifyPasswordIntent extends VerifyPasswordScreenIntent {
  String otp;

  VerifyPasswordIntent(this.otp);
}