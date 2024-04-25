import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/exceptions/network_exceptions.dart';
import '../../../core/network/network_service.dart';
import '../data/models/files_model.dart';
import '../data/models/location_model.dart';
import '../data/models/tracking_data_model.dart';
import '../data/repository/tracking_order_repository.dart';
import 'tracking_order_state.dart';

class TrackingOrderCubit extends Cubit<TrackingOrderState> {
  final TrackingOrderRepository _repository;
  TrackingOrderCubit(this._repository) : super(InitialMapState()){
    loadData();
  }

  static TrackingOrderCubit get(BuildContext context) =>
      BlocProvider.of<TrackingOrderCubit>(context);
  late GoogleMapController controller;
  // late BitmapDescriptor _markerIcon;
  final LatLng kMapCenter = const LatLng(29.4335246, 31.0564403);
  final List<Marker> marker = <Marker>[];
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<LocationModel> locations = [];
  List<FilesModel> files = [];

  List<Map<String, dynamic>> person = [
    {
      "id": "1",
      "url":
      "https://www.57357.org/app/uploads/2020/06/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-%D8%A7%D9%84%D8%B4%D8%B9%D8%B1%D8%A7%D9%88%D9%8A-%D8%B5%D9%88%D8%B1-1.jpg",
      "lat": 29.4335246,
      "lon": 31.0564403,
      "title": "الشعراوي",
    },
    {
      "id": "1",
      "url":
      "https://www.57357.org/app/uploads/2020/06/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-%D8%A7%D9%84%D8%B4%D8%B9%D8%B1%D8%A7%D9%88%D9%8A-%D8%B5%D9%88%D8%B1-1.jpg",
      "lat": 29.4335326,
      "lon": 31.0564403,
      "title": "الشعراوي",
    },
    {
      "id": "2",
      "url":
      "https://www.57357.org/app/uploads/2020/06/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-%D8%A7%D9%84%D8%B4%D8%B9%D8%B1%D8%A7%D9%88%D9%8A-%D8%B5%D9%88%D8%B1-1.jpg",
      "lat": 29.4300246,
      "lon": 31.0564403,
      "title": "الشعراوي",
    },
    {
      "id": "3",
      "url":
      "https://www.57357.org/app/uploads/2020/06/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE-%D8%A7%D9%84%D8%B4%D8%B9%D8%B1%D8%A7%D9%88%D9%8A-%D8%B5%D9%88%D8%B1-1.jpg",
      "lat": 29.4115246,
      "lon": 31.0564403,
      "title": "الشعراوي",
    },
  ];

  loadData() async {
    for (var element in person) {
      Uint8List image = await loadNetworkImage(element["url"]);
      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
          image.buffer.asUint8List(),
          targetHeight: 150,
          targetWidth: 150);
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData =
      await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();

      marker.add(Marker(
          markerId: MarkerId(element['id']),
          icon: BitmapDescriptor.fromBytes(resizedImageMarker),
          position: LatLng(
            element['lat'],
            element['lon'],
          ),
          infoWindow: InfoWindow(title: element["title"])));
    }
    // setState(() {});
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

  void onMapCreated(GoogleMapController controllerParam) async {
    // setState(() async {
      controllerParam
          .setMapStyle(await rootBundle.loadString('assets/map_style.json'));
      controller = controllerParam;
    // });
  }

  /// <<<---- get Order --->>>
  Future<void> getOrderTracking(String orderId) async {
    log("getOrderLocation ======================>>>>>>>>>>>>333");
    emit(OrderLocationLoading());
    final NetworkService<TrackingDataModel> data =
    await _repository.getOrderLocation(orderId);
    switch (data) {
      case Succeed<TrackingDataModel>(data: TrackingDataModel data):
        emit(OrderLocationSuccess());
        locations.addAll(data.trackingOrder.locations);
        locations.addAll(data.trackingOrder.locations);
      case Failure<TrackingDataModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(OrderLocationFailed(networkExceptions: error));
    }
  }
}