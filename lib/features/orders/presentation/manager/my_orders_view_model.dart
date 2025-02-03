import 'package:bloc/bloc.dart';
import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';
import 'package:flowery_rider/features/orders/domain/use_cases/my_orders_use_case.dart';
import 'package:flowery_rider/features/orders/presentation/manager/my_orders_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import 'dart:developer';

@injectable
class MyOrdersViewModel extends Cubit<MyOrdersState> {
  final MyOrdersUseCase myOrdersUseCase;

  MyOrdersViewModel(this.myOrdersUseCase) : super(MyOrdersInitial());

  Future<void> getMyOrders(String token) async {
    emit(MyOrdersLoading());
    final result = await myOrdersUseCase.getMyOrders(token);
    log('HomeCubit: getHomeData: $result');

    log('MyOrders================================ $result');
    switch (result) {
      case Success<MyOrdersEntity>():
        emit(MyOrdersSuccess(result.data));
        log('HomeCubit: getHomeData: $result');

        log('MyOrders================================  ${result.data}');

      case Fail<MyOrdersEntity>():
        emit(MyOrdersError(result.exception));
        ('MyOrders================================  ${result.exception}');
        log('HomeCubit: getHomeData: $result');
    }
  }
}
