part of 'start_order_cubit.dart';

@immutable
sealed class StartOrderState {}

final class StartOrderInitial extends StartOrderState {}

class SuccessStartOrderState extends StartOrderState {
  final StartOrderEntity? startOrderEntity;

  SuccessStartOrderState(this.startOrderEntity);
}

class LoadingStartOrderState extends StartOrderState {}

class ErrorStartOrderState extends StartOrderState {
  final Exception? exception;

  ErrorStartOrderState(this.exception);
}
