part of 'orders_cubit.dart';

class OrdersState {}

class OrdersIdle extends OrdersState {}

class OrdersLoading extends OrdersState {}
class AllOrdersVendorLoading extends OrdersState {}
class AcceptOrderVendorLoading extends OrdersState {
  final String orderId;
  AcceptOrderVendorLoading({required this.orderId});
}
class RefuseOrderVendorLoading extends OrdersState {
  final String orderId;
  RefuseOrderVendorLoading({required this.orderId});
}
class StartMissionOrderVendorLoading extends OrdersState {
  final String orderId;
  StartMissionOrderVendorLoading({required this.orderId});
}
class NextStepOrderVendorLoading extends OrdersState {}
class ServiceStepsOrderVendorLoading extends OrdersState {}
class StatusOrderLoading extends OrdersState {}

class AllOrdersVendorSuccess extends OrdersState {}
class AcceptOrderVendorSuccess extends OrdersState {}
class RefuseOrderVendorSuccess extends OrdersState {}
class StartMissionOrderVendorSuccess extends OrdersState {}
class NextStepOrderVendorSuccess extends OrdersState {}
class ServiceStepsOrderVendorSuccess extends OrdersState {}
class OrdersSuccess extends OrdersState {}
class StatusOrderSuccess extends OrdersState {
  final TitleIdListModel? statusOrder;
  StatusOrderSuccess({required this.statusOrder});
}

class ServiceStepsOrderVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  ServiceStepsOrderVendorFailed({
    required this.networkExceptions,
  });
}
class StartMissionOrderVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  StartMissionOrderVendorFailed({
    required this.networkExceptions,
  });
}
class NextStepOrderVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  NextStepOrderVendorFailed({
    required this.networkExceptions,
  });
}
class RefuseOrderVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  RefuseOrderVendorFailed({
    required this.networkExceptions,
  });
}
class AcceptOrderVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  AcceptOrderVendorFailed({
    required this.networkExceptions,
  });
}
class AllOrdersVendorFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  AllOrdersVendorFailed({
    required this.networkExceptions,
  });
}
class OrdersFailed extends OrdersState {
  final NetworkExceptions networkExceptions;
  OrdersFailed({
    required this.networkExceptions,
  });
}

class ChangeOrderTypeLoading extends OrdersState {}
class RecordVideoLoading extends OrdersState {}
class RecordVideoSuccess extends OrdersState {}
class PlayVideoSuccess extends OrdersState {}
class PlayVideoLoading extends OrdersState {}

class ChangeOrderType extends OrdersState {
  final int? orderType;

  ChangeOrderType({required this.orderType});
}
