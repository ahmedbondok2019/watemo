part of 'home_cubit.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}
class OnPageChangedLoading extends HomeState {}
class RefuseHomeOrderVendorLoading extends HomeState {
  final String orderId;
  RefuseHomeOrderVendorLoading({required this.orderId});
}
class AcceptHomeOrderVendorSuccess extends HomeState {}
class RefuseHomeOrderVendorSuccess extends HomeState {}
class AcceptHomeOrderVendorLoading extends HomeState {
  final String orderId;
  AcceptHomeOrderVendorLoading({required this.orderId});
}
class OnPageChangedType extends HomeState {
  final int currentIndex;
  OnPageChangedType({required this.currentIndex});
}
class HomeSuccess extends HomeState {}
class HomeFailed extends HomeState {
  final NetworkExceptions networkExceptions;
  HomeFailed({
    required this.networkExceptions,
  });
}
class AcceptHomeOrderVendorFailed extends HomeState {
  final NetworkExceptions networkExceptions;
  AcceptHomeOrderVendorFailed({
    required this.networkExceptions,
  });
}
class RefuseHomeOrderVendorFailed extends HomeState {
  final NetworkExceptions networkExceptions;
  RefuseHomeOrderVendorFailed({
    required this.networkExceptions,
  });
}