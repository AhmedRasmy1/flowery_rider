
import 'package:flowery_rider/features/home/domain/home_entity.dart';

import '../../domain/pending_entity.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final PendingDriverOrdersEntity pendingDriverOrdersEntity;
  HomeSuccess(this.pendingDriverOrdersEntity);
}

final class HomeFail extends HomeState {
  final Exception exception;
  HomeFail(this.exception);
}