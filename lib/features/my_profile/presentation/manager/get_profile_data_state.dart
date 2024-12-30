part of 'get_profile_data_cubit.dart';

@immutable
sealed class GetProfileDataState {}

final class GetProfileDataInitial extends GetProfileDataState {}
class SuccessGetProfileDataState extends GetProfileDataState {
  final ProfileDataModelEntity? profileDataModelEntity;

  SuccessGetProfileDataState(this.profileDataModelEntity);
}

class LoadingGetProfileDataState extends GetProfileDataState {}

class ErrorGetProfileDataState extends GetProfileDataState {
  final Exception? exception;

  ErrorGetProfileDataState(this.exception);
}
