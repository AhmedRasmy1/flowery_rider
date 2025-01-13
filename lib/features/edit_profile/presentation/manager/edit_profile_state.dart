part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

class SuccessEditProfileState extends EditProfileState {
  final EditProfileDataEntity? editProfileDataEntity;

  SuccessEditProfileState(this.editProfileDataEntity);
}

class LoadingEditProfileState extends EditProfileState {}

class ErrorEditProfileState extends EditProfileState {
  final Exception? exception;

  ErrorEditProfileState(this.exception);
}
