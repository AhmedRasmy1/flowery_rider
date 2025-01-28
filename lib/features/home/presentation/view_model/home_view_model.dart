import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import 'dart:developer';

import '../../data/response/pending__orders__response.dart';
import '../../domain/Use_case/home_use_case.dart';
import '../../domain/pending_entity.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  List<Orders>? displayedOrders =[];
  final HomeUseCase _homeUseCase;
  HomeCubit(this._homeUseCase) : super(HomeInitial());

  Future<void> getHomeData(String token) async {
    emit(HomeLoading());
    final result = await _homeUseCase.getHomeData(token);

    log('HomeCubit: getHomeData: $result');
    switch (result) {
      case Success<PendingDriverOrdersEntity>():
        {displayedOrders = result.data.orders ;
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
  void rejectOrderFromScreen(Orders order) {
    displayedOrders?.remove(order);
    emit(HomeSuccess(PendingDriverOrdersEntity(orders: displayedOrders)));
  }




}
