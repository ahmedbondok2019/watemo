part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
  @override
  List<Object?> get props => [];
}
class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {}
class CheckoutFailed extends CheckoutState {
  final NetworkExceptions networkExceptions;
  CheckoutFailed({
    required this.networkExceptions,
  });
}
class CheckCodeFailure extends CheckoutState {
  final NetworkExceptions networkExceptions;
  CheckCodeFailure({
    required this.networkExceptions,
  });
}
class CreateOrderFailure extends CheckoutState {
  final NetworkExceptions networkExceptions;
  CreateOrderFailure({
    required this.networkExceptions,
  });
}
class ChangePaymentTypeLoading extends CheckoutState {}
class CheckCodeLoading extends CheckoutState {}
class CreateOrderLoading extends CheckoutState {}
class CheckCodeSuccess extends CheckoutState {}
class CreateOrderSuccess extends CheckoutState {}
class ChangePaymentType extends CheckoutState {
  final int paymentType;
  ChangePaymentType({
    required this.paymentType,
  });
}