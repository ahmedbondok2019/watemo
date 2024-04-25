part of 'hadith_cubit.dart';

class HadithState {}

class HadithIdle extends HadithState {}

class HadithLoading extends HadithState {}
class ChangeStatusGenderLoading extends HadithState {}
class ChangeStatusMethodLoading extends HadithState {}
class ChangePaymentTypeLoading extends HadithState {}
class ChangeStatusLangLoading extends HadithState {}
class ChangeCurrentIndexLoading extends HadithState {}

class HadithSuccess extends HadithState {}

class ChangeCurrentIndex extends HadithState {
  final int currentIndex;
  ChangeCurrentIndex({
    required this.currentIndex,
  });
}

class ChangeStatusGender extends HadithState {
  final bool gender;
  ChangeStatusGender({
    required this.gender,
  });
}

class ChangeStatusLang extends HadithState {
  final int selectLang;
  ChangeStatusLang({
    required this.selectLang,
  });
}

class ChangeStatusMethod extends HadithState {
  final int selectMethod;
  ChangeStatusMethod({
    required this.selectMethod,
  });
}
class ChangePaymentType extends HadithState {
  final int paymentType;
  ChangePaymentType({
    required this.paymentType,
  });
}

class HadithFailed extends HadithState {
  final NetworkExceptions networkExceptions;
  HadithFailed({
    required this.networkExceptions,
  });
}
