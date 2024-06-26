import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/user/user_model.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class SwitchRememberLoading extends AuthState {}
class SelectCameraTaxNoImageLoading extends AuthState {}
class SelectCameraIdentityFaceImageLoading extends AuthState {}
class SelectCameraIdentityBackImageLoading extends AuthState {}
class SelectCameraVendorImageLoading extends AuthState {}
class SelectCameraTaxNoImageSuccess extends AuthState {}
class SelectCameraIdentityBackImageSuccess extends AuthState {}
class SelectCameraVendorImageSuccess extends AuthState {}
class SelectCameraIdentityFaceImageSuccess extends AuthState {}
class SelectCameraCommercialNoImagesLoading extends AuthState {}
class SelectCameraCommercialNoImagesSuccess extends AuthState {}
class SelectGalleryTaxNoImageLoading extends AuthState {}
class SelectGalleryIdentityFaceImageLoading extends AuthState {}
class SelectGalleryIdentityBackImageLoading extends AuthState {}
class SelectGalleryVendorImageLoading extends AuthState {}
class SelectGalleryTaxNoImageSuccess extends AuthState {}
class SelectGalleryIdentityFaceImageSuccess extends AuthState {}
class SelectGalleryIdentityBackImageSuccess extends AuthState {}
class SelectGalleryVendorImageSuccess extends AuthState {}
class SelectGalleryCommercialNoImagesLoading extends AuthState {}
class SelectGalleryCommercialNoImagesSuccess extends AuthState {}
class TermsAndConditionUpdateLoading extends AuthState {}
class ChangeStatusAuthLoading extends AuthState {}
class ChangeGenderLoading extends AuthState {}
class ChangeLangLoading extends AuthState {}
class ChangeServicesLoading extends AuthState {}

class SwitchRememberState extends AuthState {
  final bool switchRemember;

  SwitchRememberState({required this.switchRemember});
}

class SwitchVisibility extends AuthState {
  final bool visibility;

  SwitchVisibility({required this.visibility});
}

class ChangeStatusAuth extends AuthState {
  final bool isLogin;

  ChangeStatusAuth({required this.isLogin});
}

class ChangeCountryCodeSuccess extends AuthState {
  final TitleIdListModel? country;

  ChangeCountryCodeSuccess({required this.country});
}
class ChangeCountrySuccess extends AuthState {
  final TitleIdListModel? country;

  ChangeCountrySuccess({required this.country});
}
class ChangeNationalitySuccess extends AuthState {
  final TitleIdListModel? nationality;

  ChangeNationalitySuccess({required this.nationality});
}
class ChangeGenderSuccess extends AuthState {
  final TitleIdListModel? gender;

  ChangeGenderSuccess({required this.gender});
}
class ChangeLangSuccess extends AuthState {
  final TitleIdListModel? lang;

  ChangeLangSuccess({required this.lang});
}
class ChangeServicesSuccess extends AuthState {
  final TitleIdListModel? service;

  ChangeServicesSuccess({required this.service});
}
class ChangeCountryLoading extends AuthState {}
class ChangeNationalityLoading extends AuthState {}
class ChangeCountryCodeLoading extends AuthState {}
class ChangeCitySuccess extends AuthState {
  final TitleIdListModel? city;

  ChangeCitySuccess({required this.city});
}
class ChangeYearSuccess extends AuthState {
  final String? year;

  ChangeYearSuccess({required this.year});
}
class ChangeMonthSuccess extends AuthState {
  final String? month;

  ChangeMonthSuccess({required this.month});
}
class ChangeDaySuccess extends AuthState {
  final String? day;

  ChangeDaySuccess({required this.day});
}

class ChangeCityLoading extends AuthState {}
class ChangeYearLoading extends AuthState {}
class ChangeMonthLoading extends AuthState {}
class ChangeDayLoading extends AuthState {}
class TimerLoading extends AuthState {}

class TimerLoaded extends AuthState {}

class ObscurePasswordTextUpdateState extends AuthState {}

class TermsAndConditionUpdateState extends AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserModel? user;
  LoginSuccess({required this.user});
}

class LoginFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  LoginFailure({
    required this.networkExceptions,
  });
}

class RegisterInitial extends AuthState {}
class LogOutInitial extends AuthState {}

class RegisterUserLoading extends AuthState {}
class RegisterCompanyLoading extends AuthState {}
class RegisterVendorLoading extends AuthState {}
class LogOutLoading extends AuthState {}
class ForgetPasswordLoading extends AuthState {}
class ForgetPasswordSuccess extends AuthState {
  final String? otpPhoneNumber;
  final String? otp;
  ForgetPasswordSuccess({
    required this.otpPhoneNumber,
    required this.otp,
  });
}
class ForgetPasswordFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  ForgetPasswordFailure({
    required this.networkExceptions,
  });
}
class RegisterUserSuccess extends AuthState {}
class RegisterCompanySuccess extends AuthState {}
class RegisterVendorSuccess extends AuthState {
  final UserModel? user;
  RegisterVendorSuccess({required this.user});
}
class LogOutSuccess extends AuthState {}
class ForgetPasswordInitial extends AuthState {}

class LogOutFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  LogOutFailure({
    required this.networkExceptions,
  });
}
class RegisterUserFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  RegisterUserFailure({
    required this.networkExceptions,
  });
}
class RegisterCompanyFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  RegisterCompanyFailure({
    required this.networkExceptions,
  });
}
class RegisterVendorFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  RegisterVendorFailure({
    required this.networkExceptions,
  });
}

class DeleteAccountLoading extends AuthState {}

class DeleteAccountSuccess extends AuthState {
  final String message;

  DeleteAccountSuccess({required this.message});
}

class DeleteAccountFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  DeleteAccountFailure({
    required this.networkExceptions,
  });
}

class LogoutLoading extends AuthState {}
class GetCountriesLoading extends AuthState {}
class GetCitiesLoading extends AuthState {}
class GetCountriesSuccess extends AuthState {}
class SpokenLanguagesLoading extends AuthState {}
class ClearDataLoading extends AuthState {}
class GoogleLoginLoading extends AuthState {}
class FacebookLoginLoading extends AuthState {}
class AppleLoginLoading extends AuthState {}
class GoogleLoginSuccess extends AuthState {}
class FacebookLoginSuccess extends AuthState {}
class AppleLoginSuccess extends AuthState {}
class ClearDataSuccess extends AuthState {}
class SpokenLanguagesSuccess extends AuthState {}
class GetCitiesSuccess extends AuthState {}
class GetCountriesFailed extends AuthState {
  final NetworkExceptions networkExceptions;
  GetCountriesFailed({
    required this.networkExceptions,
  });
}
class GoogleLoginFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  GoogleLoginFailure({
    required this.networkExceptions,
  });
}
class GetCitiesFailed extends AuthState {
  final NetworkExceptions networkExceptions;
  GetCitiesFailed({
    required this.networkExceptions,
  });
}
class SpokenLanguagesFailed extends AuthState {
  final NetworkExceptions networkExceptions;
  SpokenLanguagesFailed({
    required this.networkExceptions,
  });
}
class FacebookLoginFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  FacebookLoginFailure({
    required this.networkExceptions,
  });
}
class AppleLoginFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  AppleLoginFailure({
    required this.networkExceptions,
  });
}

class LogoutSuccess extends AuthState {
  final String message;

  LogoutSuccess({required this.message});
}

class LogoutFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  LogoutFailure({
    required this.networkExceptions,
  });
}