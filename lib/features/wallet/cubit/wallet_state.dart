part of 'wallet_cubit.dart';

class WalletState {}

class WalletIdle extends WalletState {}

class WalletLoading extends WalletState {}
class LastWalletLoading extends WalletState {}
class AddAmountToWalletLoading extends WalletState {}
class ChangeStatusGenderLoading extends WalletState {}
class ChangeStatusMethodLoading extends WalletState {}
class ChangePaymentTypeLoading extends WalletState {}
class ChangeStatusLangLoading extends WalletState {}
class ChangeCurrentIndexLoading extends WalletState {}

class WalletSuccess extends WalletState {}
class AddAmountToWalletSuccess extends WalletState {
  final String? message;
  AddAmountToWalletSuccess({required this.message});
}
class LastWalletSuccess extends WalletState {}

class ChangeCurrentIndex extends WalletState {
  final int currentIndex;
  ChangeCurrentIndex({
    required this.currentIndex,
  });
}

class ChangeStatusGender extends WalletState {
  final bool gender;
  ChangeStatusGender({
    required this.gender,
  });
}

class ChangeStatusLang extends WalletState {
  final int selectLang;
  ChangeStatusLang({
    required this.selectLang,
  });
}

class ChangeStatusMethod extends WalletState {
  final int selectMethod;
  ChangeStatusMethod({
    required this.selectMethod,
  });
}
class ChangePaymentType extends WalletState {
  final int paymentType;
  ChangePaymentType({
    required this.paymentType,
  });
}

class WalletFailed extends WalletState {
  final NetworkExceptions networkExceptions;
  WalletFailed({
    required this.networkExceptions,
  });
}
class AddAmountToWalletFailure extends WalletState {
  final NetworkExceptions networkExceptions;
  AddAmountToWalletFailure({
    required this.networkExceptions,
  });
}
class LastWalletFailed extends WalletState {
  final NetworkExceptions networkExceptions;
  LastWalletFailed({
    required this.networkExceptions,
  });
}
