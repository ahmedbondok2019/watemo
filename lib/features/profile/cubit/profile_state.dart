part of 'profile_cubit.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}
class RemoveAccountInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class SelectGalleryTaxNoImageLoading extends ProfileState {}
class SelectGalleryTaxNoImageSuccess extends ProfileState {}
class SelectCameraTaxNoImageLoading extends ProfileState {}
class SelectCameraTaxNoImageSuccess extends ProfileState {}
class SelectGalleryCommercialNoImagesLoading extends ProfileState {}
class SelectGalleryCommercialNoImagesSuccess extends ProfileState {}
class SelectCameraCommercialNoImagesLoading extends ProfileState {}
class SelectCameraCommercialNoImagesSuccess extends ProfileState {}
class RemoveAccountLoading extends ProfileState {}
class LoadUserDataLoading extends ProfileState {}
class LoadUserDataSuccess extends ProfileState {}
class ChangeCountryCodeLoading extends ProfileState {}
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
class ChangeYearLoading extends ProfileState {}
class ChangeMonthLoading extends ProfileState {}
class ChangeDayLoading extends ProfileState {}
class ChangeYearSuccess extends ProfileState {
  final int? year;

  ChangeYearSuccess({required this.year});
}
class ChangeMonthSuccess extends ProfileState {
  final int? month;

  ChangeMonthSuccess({required this.month});
}
class ChangeDaySuccess extends ProfileState {
  final int? day;

  ChangeDaySuccess({required this.day});
}
class GetCountriesLoading extends ProfileState {}
class GetCitiesLoading extends ProfileState {}
class GetCountriesSuccess extends ProfileState {}
class SpokenLanguagesLoading extends ProfileState {}
class ChangeServicesLoading extends ProfileState {}
class ChangeServicesSuccess extends ProfileState {
  final TitleIdListModel? service;
  ChangeServicesSuccess({required this.service});
}
class ChangeCountryCodeSuccess extends ProfileState {
  final TitleIdListModel? countryCode;
  ChangeCountryCodeSuccess({required this.countryCode});
}
class SpokenLanguagesSuccess extends ProfileState {}
class GetCitiesSuccess extends ProfileState {}
class GetCountriesFailed extends ProfileState {
  final NetworkExceptions networkExceptions;
  GetCountriesFailed({
    required this.networkExceptions,
  });
}
class GetCitiesFailed extends ProfileState {
  final NetworkExceptions networkExceptions;
  GetCitiesFailed({
    required this.networkExceptions,
  });
}
class SpokenLanguagesFailed extends ProfileState {
  final NetworkExceptions networkExceptions;
  SpokenLanguagesFailed({
    required this.networkExceptions,
  });
}
class ChangeCountrySuccess extends ProfileState {
  final TitleIdListModel? country;

  ChangeCountrySuccess({required this.country});
}
class ChangeGenderSuccess extends ProfileState {
  final TitleIdListModel? gender;

  ChangeGenderSuccess({required this.gender});
}
class ChangeLangSuccess extends ProfileState {
  final TitleIdListModel? lang;

  ChangeLangSuccess({required this.lang});
}
class ChangeCountryLoading extends ProfileState {}
class ChangeGenderLoading extends ProfileState {}
class ChangeLangLoading extends ProfileState {}
class ChangeCityLoading extends ProfileState {}
class ChangeCitySuccess extends ProfileState {
  final TitleIdListModel? city;

  ChangeCitySuccess({required this.city});
}

class SelectGalleryIdentityFaceImageLoading extends ProfileState {}
class SelectGalleryIdentityBackImageLoading extends ProfileState {}
class SelectGalleryIdentityFaceImageSuccess extends ProfileState {}
class SelectGalleryIdentityBackImageSuccess extends ProfileState {}
class SelectCameraIdentityFaceImageLoading extends ProfileState {}
class SelectCameraIdentityBackImageLoading extends ProfileState {}
class SelectCameraIdentityFaceImageSuccess extends ProfileState {}
class SelectCameraIdentityBackImageSuccess extends ProfileState {}


