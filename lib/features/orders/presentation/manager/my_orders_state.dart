import 'package:flowery_rider/features/orders/domain/entities/my_orders_entity.dart';

sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrdersSuccess extends MyOrdersState {
  final MyOrdersEntity myOrdersEntity;

  MyOrdersSuccess(this.myOrdersEntity);
}

final class MyOrdersError extends MyOrdersState {
  final Exception exception;

  MyOrdersError(this.exception);
}
