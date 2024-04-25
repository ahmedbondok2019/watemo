part of 'services_cubit.dart';

class ServicesState {}
class ServicesIdle extends ServicesState {}
class ServicesLoading extends ServicesState {}
class SpokenLanguagesLoading extends ServicesState {}
class ChangeStatusGenderLoading extends ServicesState {}
class ChangeStatusMethodLoading extends ServicesState {}
class ChangePaymentTypeLoading extends ServicesState {}
class ChangeStatusLangLoading extends ServicesState {}
class ServicesSuccess extends ServicesState {}
class SpokenLanguagesSuccess extends ServicesState {}
class ChangeStatusGender extends ServicesState {
  final bool gender;
  ChangeStatusGender({
    required this.gender,
  });
}
class ChangeStatusLang extends ServicesState {
  final List<int> selectLang;
  ChangeStatusLang({
    required this.selectLang,
  });
}
class ChangeStatusMethod extends ServicesState {
  final int selectMethod;
  ChangeStatusMethod({
    required this.selectMethod,
  });
}
class ChangePaymentType extends ServicesState {
  final int paymentType;
  ChangePaymentType({
    required this.paymentType,
  });
}
class ServicesFailed extends ServicesState {
  final NetworkExceptions networkExceptions;
  ServicesFailed({
    required this.networkExceptions,
  });
}
class SpokenLanguagesFailed extends ServicesState {
  final NetworkExceptions networkExceptions;
  SpokenLanguagesFailed({
    required this.networkExceptions,
  });
}