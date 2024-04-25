part of 'orders_cubit.dart';

class OrdersState {}

class OrdersIdle extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {}

class OrdersFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  OrdersFailed({
    required this.networkExceptions,
  });
}

class ChangeOrderTypeLoading extends OrdersState {}

class ChangeOrderType extends OrdersState {
  final int orderType;

  ChangeOrderType({required this.orderType});
}
