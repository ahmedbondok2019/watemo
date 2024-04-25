part of 'offers_cubit.dart';

class OffersState {}

class OffersIdle extends OffersState {}

class OffersLoading extends OffersState {}
class ChangeStatusGenderLoading extends OffersState {}
class ChangeStatusMethodLoading extends OffersState {}
class ChangePaymentTypeLoading extends OffersState {}
class ChangeStatusLangLoading extends OffersState {}
class ChangeCurrentIndexLoading extends OffersState {}

class OffersSuccess extends OffersState {}

class ChangeCurrentIndex extends OffersState {
  final int currentIndex;
  ChangeCurrentIndex({
    required this.currentIndex,
  });
}

class ChangeStatusGender extends OffersState {
  final bool gender;
  ChangeStatusGender({
    required this.gender,
  });
}

class ChangeStatusLang extends OffersState {
  final int selectLang;
  ChangeStatusLang({
    required this.selectLang,
  });
}

class ChangeStatusMethod extends OffersState {
  final int selectMethod;
  ChangeStatusMethod({
    required this.selectMethod,
  });
}
class ChangePaymentType extends OffersState {
  final int paymentType;
  ChangePaymentType({
    required this.paymentType,
  });
}

class OffersError extends OffersState {
  final NetworkExceptions networkExceptions;
  OffersError({
    required this.networkExceptions,
  });
}
