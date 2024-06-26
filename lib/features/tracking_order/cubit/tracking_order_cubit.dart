import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_widget_marker/the_widget_marker.dart';
import '../../../core/src/app_export.dart';
import 'dart:ui' as ui;
import '../data/models/steps/steps_model.dart';
import '../data/models/tracking_data_model.dart';
import '../data/repository/tracking_order_repository.dart';
part 'tracking_order_state.dart';

class TrackingOrderCubit extends Cubit<TrackingOrderState> {
  final TrackingOrderRepository _repository;

  TrackingOrderCubit(this._repository) : super(TrackingOrderIdle());

  static TrackingOrderCubit get(BuildContext context) =>
      BlocProvider.of<TrackingOrderCubit>(context);

  /// map
  late GoogleMapController controller;
  BitmapDescriptor? bitmapDescriptor;
  LatLng kMapCenter = const LatLng(24.413204948872924, 39.47207509340783);
  List<Marker> marker = [];
  Marker? resizedMarker;
  Map<PolylineId, Polyline> mapPolyLines = {};
  int _polylineIdCounter = 1;

  Future<void> setMarkerForTrainer(List<StepsModel> stepsList) async {
    emit(SetMarkerLoading());
    try {
      getPolyline(stepsList);
      for (int index = 0; index < stepsList.length; index++) {
        marker.add(Marker(
            icon: await MarkerIcon.pictureAsset(
                assetPath: ImageConstants.providerPerson,
                width: 100.w,
                height: 100.h),
            markerId: MarkerId(stepsList[index].lng.toString()),
            position: LatLng(
              double.parse(stepsList[index].lat ?? "0.0"),
              double.parse(stepsList[index].lng ?? "0.0"),
            ),
            infoWindow: InfoWindow(title: stepsList[index].lng.toString())));
        emit(SetMarkerSuccess());
      }
      emit(SetMarkerSuccess());
    } catch (e) {
      emit(SetMarkerFailure());
    }
  }

  Future<Uint8List> loadNetworkImage(path) async {
    final completed = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completed.complete(info)));
    final imageInfo = await completed.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void getPolyline(List<StepsModel> locationsList) {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: AppColors.white,
      width: 5,
      points: createPoints(locationsList),
    );
    mapPolyLines[polylineId] = polyline;
    emit(SetMarkerSuccess());
  }

  List<LatLng> createPoints(List<StepsModel> locationsList) {
    final List<LatLng> points = <LatLng>[];
    for (var loc in locationsList) {
      points.add(LatLng(
          double.parse(loc.lat ?? "0.0"), double.parse(loc.lng ?? "0.0")));
    }
    return points;
  }

  void onMapCreated(GoogleMapController controllerParam) async {
    controllerParam
        .setMapStyle(await rootBundle.loadString('assets/map_style.json'));
    controller = controllerParam;
  }

  List<StepsModel> steps = [];

  /// <<<---- get Order Tracking --->>>
  Future<void> getOrderTracking(String orderId) async {
    emit(GetOrderTrackingLoading());
    final NetworkService<TrackingDataModel> data =
        await _repository.getOrderTracking(orderId);
    switch (data) {
      case Succeed<TrackingDataModel>(data: TrackingDataModel data):
        steps = [];
        marker = [];
        mapPolyLines = {};
        _polylineIdCounter = 1;
        steps.addAll(data.steps);
        setMarkerForTrainer(steps);
        emit(GetOrderTrackingSuccess());
      case Failure<TrackingDataModel>(
          networkExceptions: NetworkExceptions error
        ):
        emit(GetOrderTrackingFailed(networkExceptions: error));
    }
  }

  /// <<---clear data --->>
  Future clearData() async {
    emit(ClearDataLoading());
    steps = [];
    marker = [];
    mapPolyLines = {};
    _polylineIdCounter = 1;
    emit(ClearDataSuccess());
  }
}