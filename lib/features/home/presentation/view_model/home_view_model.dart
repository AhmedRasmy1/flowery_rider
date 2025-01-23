import 'package:bloc/bloc.dart';
import 'package:flowery_rider/features/home/domain/home_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'dart:developer';
import 'package:bloc/bloc.dart';

import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/Use_case/home_use_case.dart';
import '../../domain/pending_entity.dart';
import 'home_state.dart';


@injectable
class HomeCubit extends Cubit<HomeState> {

  final HomeUseCase _homeUseCase;
  HomeCubit(this._homeUseCase) : super(HomeInitial());
  Future<void> getHomeData(String token) async {
    emit(HomeLoading());
    final result = await _homeUseCase.getHomeData(token);
    log('HomeCubit: getHomeData: $result');
    switch (result) {
      case Success<PendingDriverOrdersEntity>():
        {
          if (!isClosed) {
            emit(HomeSuccess(result.data));
          }
          log('HomeCubit: getHomeData: ${result.data}');
        }

      case Fail<PendingDriverOrdersEntity>():
        {
          emit(HomeFail(result.exception));
          log('HomeCubit: getHomeData: ${result.exception}');
        }
    }
  }
}
