import '../../../../core/src/app_export.dart';
import '../models/next_step/next_step_model.dart';
import '../models/order_step/order_steps_res_model.dart';
import '../models/user_order/orders_res_model.dart';
import '../models/vendor_order/vendor_all_orders_res_model.dart';

class OrdersRepository {
  final OrdersDataSource _dataSource;

  OrdersRepository(this._dataSource);

  /// <<<--- get Orders --->>>
  Future<NetworkService<OrdersResModel>> getOrders(String orderType) async {
    try {
      Response response = await _dataSource.getOrders(orderType);
      OrdersResModel orders = OrdersResModel.fromJson(response.data);
      return NetworkService.succeed(orders);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- get all Orders Vendor --->>>
  Future<NetworkService<VendorAllOrdersResModel>> getAllOrdersVendor(
      String status, String pageNumber) async {
    try {
      Response response =
          await _dataSource.getAllOrdersVendor(status, pageNumber);
      VendorAllOrdersResModel orders =
          VendorAllOrdersResModel.fromJson(response.data);
      return NetworkService.succeed(orders);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- accept Order Vendor --->>>
  Future<NetworkService<dynamic>> acceptOrderVendor(
      {required String orderId}) async {
    try {
      Response response = await _dataSource.acceptOrderVendor(orderId: orderId);
      return NetworkService.succeed(response.data);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- refuse Order Vendor --->>>
  Future<NetworkService<dynamic>> refuseOrderVendor(
      {required String orderId}) async {
    try {
      Response response = await _dataSource.refuseOrderVendor(orderId: orderId);
      return NetworkService.succeed(response.data);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- start Mission Order Vendor --->>>
  Future<NetworkService<dynamic>> startMissionOrderVendor({
    required String orderId,
    required double lat,
    required double lng,
  }) async {
    try {
      Response response = await _dataSource.startMissionOrderVendor(
        orderId: orderId,
        lat: lat,
        lng: lng,
      );
      return NetworkService.succeed(response.data);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- service Steps Order Vendor --->>>
  Future<NetworkService<OrderStepsResModel>> serviceStepsOrderVendor({
    required String orderId,
    required String serviceId,
  }) async {
    try {
      Response response = await _dataSource.serviceStepsOrderVendor(
          orderId: orderId, serviceId: serviceId);
      OrderStepsResModel orderStepsResModel =
          OrderStepsResModel.fromJson(response.data);
      return NetworkService.succeed(orderStepsResModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- next Step Order Vendor --->>>
  Future<NetworkService<OrderStepsResModel>> nextStepOrderVendor(
      {required NextStepModel nextStep}) async {
    try {
      Response response = await _dataSource.nextStepOrderVendor(
        nextStep: nextStep);
      OrderStepsResModel orderStepsResModel =
          OrderStepsResModel.fromJson(response.data);
      return NetworkService.succeed(orderStepsResModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
