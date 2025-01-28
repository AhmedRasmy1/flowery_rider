import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/api_result.dart';
import '../../data/models/request/update_order_request.dart';
import '../../domain/entities/update_order_state_entity.dart';
import '../../domain/use_cases/start_order_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/start_order_entity.dart';

part 'start_order_state.dart';

@injectable
class StartOrderCubit extends Cubit<StartOrderState> {
  StartOrderCubit(this._startOrderUseCase) : super(StartOrderInitial());

  final StartOrderUseCase _startOrderUseCase;

  static StartOrderCubit get(context)=>BlocProvider.of(context);


  void startOrder(String orderId) async {
    emit(LoadingStartOrderState());
    var result = await _startOrderUseCase.startOrder(orderId);
    switch (result) {
      case Success<StartOrderEntity?>():
        if (!isClosed) {
          emit(SuccessStartOrderState(result.data));
        }
      case Fail<StartOrderEntity?>():
        if (isClosed) {
          emit(ErrorStartOrderState(result.exception));
        }
    }
  }

  void updateOrder(  String orderId,UpdateOrderRequest updateOrderRequest) async {
    log(updateOrderRequest.state.toString());
    var result= await _startOrderUseCase.updateOrder(orderId,updateOrderRequest);

    switch (result) {
      case Success<UpdateOrderStateEntity?>():
        if (!isClosed) {
          emit(SuccessUpdateOrderState(result.data));
        }
      case Fail<UpdateOrderStateEntity?>():
        if (isClosed) {
          emit(ErrorStartOrderState(result.exception));
        }
    }
  }
}