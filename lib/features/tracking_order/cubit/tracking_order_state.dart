import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/exceptions/network_exceptions.dart';

abstract class TrackingOrderState {}

class InitialMapState extends TrackingOrderState {}
class OrderLocationLoading extends TrackingOrderState {}
class ImageVideosLoading extends TrackingOrderState {}
class OrderLocationSuccess extends TrackingOrderState {}
class ImageVideosSuccess extends TrackingOrderState {}

class LoadedMapState extends TrackingOrderState {
  final LatLng initialPosition;

  LoadedMapState(this.initialPosition);
}
class OrderLocationFailed extends TrackingOrderState {
  final NetworkExceptions networkExceptions;
  OrderLocationFailed({
    required this.networkExceptions,
  });
}
class ImageVideosFailed extends TrackingOrderState {
  final NetworkExceptions networkExceptions;
  ImageVideosFailed({
    required this.networkExceptions,
  });
}