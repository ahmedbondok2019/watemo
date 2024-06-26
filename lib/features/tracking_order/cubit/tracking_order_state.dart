part of 'tracking_order_cubit.dart';

class TrackingOrderState {}

class TrackingOrderIdle extends TrackingOrderState {}
class SetMarkerLoading extends TrackingOrderState {}
class SetMarkerSuccess extends TrackingOrderState {}
class SetMarkerFailure extends TrackingOrderState {}
class GetOrderTrackingLoading extends TrackingOrderState {}
class ClearDataLoading extends TrackingOrderState {}
class ClearDataSuccess extends TrackingOrderState {}
class ImageVideosLoading extends TrackingOrderState {}
class GetOrderTrackingSuccess extends TrackingOrderState {}
class ImageVideosSuccess extends TrackingOrderState {}

class LoadedMapState extends TrackingOrderState {
  final LatLng initialPosition;

  LoadedMapState(this.initialPosition);
}
class GetOrderTrackingFailed extends TrackingOrderState {
  final NetworkExceptions networkExceptions;
  GetOrderTrackingFailed({
    required this.networkExceptions,
  });
}
class ImageVideosFailed extends TrackingOrderState {
  final NetworkExceptions networkExceptions;
  ImageVideosFailed({
    required this.networkExceptions,
  });
}