import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/src/app_export.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class SwitchRememberLoading extends AuthState {}
class TermsAndConditionUpdateLoading extends AuthState {}
class ChangeStatusAuthLoading extends AuthState {}
class ChangeNationalityLoading extends AuthState {}

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

class ChangeNationality extends AuthState {
  final TitleIdListModel? nationality;

  ChangeNationality({required this.nationality});
}

class ChangeResidence extends AuthState {
  final TitleIdListModel? residence;

  ChangeResidence({required this.residence});
}

class TimerLoading extends AuthState {}

class TimerLoaded extends AuthState {}

class ObscurePasswordTextUpdateState extends AuthState {}

class TermsAndConditionUpdateState extends AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  LoginFailure({
    required this.networkExceptions,
  });
}

class RegisterInitial extends AuthState {}
class LogOutInitial extends AuthState {}

class RegisterLoading extends AuthState {}
class NationalityResidenceLoading extends AuthState {}
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
class RegisterSuccess extends AuthState {}
class NationalityResidenceSuccess extends AuthState {}
class LogOutSuccess extends AuthState {}
class ForgetPasswordInitial extends AuthState {}

class LogOutFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  LogOutFailure({
    required this.networkExceptions,
  });
}
class RegisterFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  RegisterFailure({
    required this.networkExceptions,
  });
}

class NationalityResidenceFailure extends AuthState {
  final NetworkExceptions networkExceptions;
  NationalityResidenceFailure({
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