part of 'profile_cubit.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}
class RemoveAccountInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class RemoveAccountLoading extends ProfileState {}
class LoadUserDataLoading extends ProfileState {}
class LoadUserDataSuccess extends ProfileState {}
class ProfileSuccess extends ProfileState {}
class RemoveAccountSuccess extends ProfileState {}
class ProfileFailure extends ProfileState {
  final NetworkExceptions networkExceptions;
  ProfileFailure({
    required this.networkExceptions,
  });
}
class RemoveAccountFailure extends ProfileState {
  final NetworkExceptions networkExceptions;
  RemoveAccountFailure({
    required this.networkExceptions,
  });
}


class SelectCameraImageLoading extends ProfileState {}
class ChangeReasonLoading extends ProfileState {}
class SelectCameraImageSuccess extends ProfileState {}
class ChangeReasonSuccess extends ProfileState {}

class SelectGalleryImageLoading extends ProfileState {}
class SelectGalleryImageSuccess extends ProfileState {}
