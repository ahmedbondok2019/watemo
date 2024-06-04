import 'dart:developer';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/src/app_export.dart';
import '../../../core/utils/utils.dart';
import '../data/models/next_step/next_step_model.dart';
import '../data/models/order_step/order_steps_res_model.dart';
import '../data/models/order_step/step_model.dart';
import '../data/models/user_order/orders_model.dart';
import '../data/models/user_order/orders_res_model.dart';
import '../data/models/vendor_order/vendor_all_orders_res_model.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository _repository;
  OrdersCubit(this._repository) : super(OrdersIdle());

  static OrdersCubit get(context) => BlocProvider.of<OrdersCubit>(context);

  int? orderType;
  int pageNumber = 1;
  LatLng? kMapCenter;
  File? myVideo;
  VideoPlayerController? controller;

  recordVideo() async {
    emit(RecordVideoLoading());
    var video = await Utils.getVideo();
    myVideo = File(video!.path);
    controller = VideoPlayerController.file(myVideo!)
      ..initialize().then((_) {});
    emit(RecordVideoSuccess());
  }

  playVideo() async {
    emit(PlayVideoLoading());
    controller!.value.isPlaying
        ? controller!.pause()
        : controller!.play();
    emit(PlayVideoSuccess());
  }

  void changeOrderType(int? type) {
    emit(ChangeOrderTypeLoading());
    orderType = type;
    getOrders();
    emit(ChangeOrderType(orderType: orderType));
  }

  List<List<OrdersModel>> ordersList = [];
  List<OrdersModel> ordersVendorList = [];
  List<String> ordersDateList = [];
  TitleIdListModel? statusOrder;
  List<TitleIdListModel> statusOrders = [
    TitleIdListModel(
      title: "all_orders",
      id: 0,
    ),
    TitleIdListModel(
      title: "processing",
      id: 1,
    ),
    TitleIdListModel(
      title: "completed",
      id: 2,
    ),
  ];

  void changeStatusOrder(TitleIdListModel? val) {
    emit(StatusOrderLoading());
    statusOrder = val;
    getAllOrdersVendor();
    emit(StatusOrderSuccess(statusOrder: val));
  }

  /// <<<--- get Orders for user--->>>
  Future<void> getOrders() async {
    log("message ======================>>>>>>>>>>>>333");
    emit(OrdersLoading());
    ordersDateList = [];
    ordersList = [];
    final NetworkService<OrdersResModel> data =
    await _repository.getOrders(
        orderType == null
            ? ""
            : orderType.toString());
    switch (data) {
      case Succeed<OrdersResModel>(data: OrdersResModel data):
        emit(OrdersSuccess());
        if(data.orders != null){
          data.orders!.forEach((key, value) {
            ordersDateList.add(key);
            List<OrdersModel> orders =
            List<OrdersModel>.from(value.map((x) => OrdersModel.fromJson(x)));
            ordersList.add(orders);
          });
        }
        if(ordersDateList.isNotEmpty && ordersList.isNotEmpty){
          ordersDateList.reversed;
          ordersList.reversed;
        }
      case Failure<OrdersResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(OrdersFailed(networkExceptions: error));
    }
  }

  /// <<<--- get all Orders Vendor --->>>
  Future<void> getAllOrdersVendor() async {
    log("get all Orders Vendor ======================>>>>>>>>>>>>333");
    emit(OrdersLoading());
    final NetworkService<VendorAllOrdersResModel> data =
    await _repository.getAllOrdersVendor(
        statusOrder == null
            ? ""
            : statusOrder!.id == 0
               ? ""
               : statusOrder!.id.toString(),
        pageNumber.toString());
    switch (data) {
      case Succeed<VendorAllOrdersResModel>(
          data: VendorAllOrdersResModel data):
        emit(OrdersSuccess());
        ordersVendorList.clear();
        ordersVendorList.addAll(data.orders);
      case Failure<VendorAllOrdersResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(OrdersFailed(networkExceptions: error));
    }
  }

  /// <<<--- ACCEPT Orders Vendor --->>>
  Future<void> acceptOrderVendor({required String orderId}) async {
    log("accept Order Vendor ======================>>>>>>>>>>>>$orderId");
    emit(AcceptOrderVendorLoading(orderId: orderId));
    final NetworkService<dynamic> data =
     await _repository.acceptOrderVendor(orderId: orderId);
    switch (data) {
      case Succeed<void>():
        getAllOrdersVendor();
        emit(AcceptOrderVendorSuccess());
      case Failure<void>(
          networkExceptions: NetworkExceptions error
      ):emit(AcceptOrderVendorFailed(networkExceptions: error));
    }
  }

  /// <<<--- refuse Orders Vendor --->>>
  Future<void> refuseOrderVendor({required String orderId}) async {
    log("refuse Order Vendor ======================>>>>>>>>>>>>$orderId");
    emit(RefuseOrderVendorLoading(orderId: orderId));
    final NetworkService<dynamic> data = await _repository.refuseOrderVendor(orderId: orderId);
    switch (data) {
      case Succeed<void>():
        getAllOrdersVendor();
        emit(RefuseOrderVendorSuccess());
      case Failure<void>(
          networkExceptions: NetworkExceptions error
      ):
        emit(RefuseOrderVendorFailed(
            networkExceptions: error));
    }
  }

  /// <<<--- start mission Orders Vendor --->>>
  Future<void> startMissionOrderVendor({required String orderId}) async {
    log("Start Mission Order Vendor ======================>>>>>>>>>>>>$orderId");
    emit(StartMissionOrderVendorLoading(orderId: orderId));
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final NetworkService<dynamic> data =
      await _repository.startMissionOrderVendor(
          orderId: orderId,
        lat: position.latitude,
        lng: position.longitude,
      );
    switch (data) {
      case Succeed<void>():
        emit(StartMissionOrderVendorSuccess());
      case Failure<void>(
          networkExceptions: NetworkExceptions error
      ):
        emit(StartMissionOrderVendorFailed(
            networkExceptions: error));
    }
  }

  /// <<<--- service steps Orders Vendor --->>>
  List<StepModel> steppers = [];
  List<String> videos = [];
  List<String> titles = [];
  String? stepId;
  Future<void> serviceStepsOrderVendor({
    required String orderId, required String serviceId
  }) async {
    emit(ServiceStepsOrderVendorLoading());
    final NetworkService<OrderStepsResModel> data =
    await _repository.serviceStepsOrderVendor(
        orderId: orderId, serviceId: serviceId
    );
    switch (data) {
      case Succeed<OrderStepsResModel>(data: OrderStepsResModel data):
        log("error error ======>>>>> ${data.error}");
        steppers = [];
        videos = [];
        titles = [];
        steppers.addAll(data.steps);
        for (var element in steppers) {
          if(element.video!.isNotEmpty && element.video != null
              && element.video != ""){
            videos.add(element.video!);
            titles.add(element.text!);
          }
        }
        for (var element in steppers) {
          if(element.status == false){
            stepId = element.id.toString();
            break;
          }
        }
        emit(ServiceStepsOrderVendorSuccess());
      case Failure<OrderStepsResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(ServiceStepsOrderVendorFailed(
            networkExceptions: error));
    }
  }

  /// <<<--- next Step Order Vendor --->>>
  Future<void> nextStep({required String orderId}) async {
    log("next Step Order Vendor orderId======================>>>>>>>>>>>>$orderId");
    log("next Step Order Vendor ======================>>>>>>>>>>>>$stepId");
    emit(NextStepOrderVendorLoading());
    final mimeType = lookupMimeType(myVideo!.path);
    final video = await MultipartFile.fromFile(
      myVideo!.path,
      filename: myVideo!.path.split('/').last,
      contentType: MediaType(mimeType!.split('/').first,
          myVideo!.path.split(".").last), //important
    );
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    NextStepModel nextStep = NextStepModel(
        orderId: orderId,
        stepId: stepId.toString(),
      video: video,
      lat: position.latitude.toString(),
      lng: position.longitude.toString(),
    );
    final NetworkService<OrderStepsResModel> data =
    await _repository.nextStepOrderVendor(nextStep: nextStep);
    switch (data) {
      case Succeed<OrderStepsResModel>(data: OrderStepsResModel stepModel):
        log("error error ======>>>>> ${stepModel.error}");
        steppers = [];
        videos = [];
        titles = [];
        steppers.addAll(stepModel.steps);
        myVideo = null;
        controller = null;
        for (var element in steppers) {
          if(element.video!.isNotEmpty && element.video != null
              && element.video != ""){
            videos.add(element.video!);
            titles.add(element.text!);
          }
        }
        for (var element in steppers) {
          if(element.status == false){
            stepId = element.id.toString();
            break;
          }
        }
        emit(NextStepOrderVendorSuccess());
      case Failure<OrderStepsResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(NextStepOrderVendorFailed(networkExceptions: error));
    }
  }
}