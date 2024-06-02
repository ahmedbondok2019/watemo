import '../../../../core/src/app_export.dart';
import '../models/next_step/next_step_model.dart';

class OrdersDataSource {
  final BaseDioHelper baseDioHelper;
  OrdersDataSource(this.baseDioHelper);

  /// <<<--- get Orders --->>>
  Future<Response> getOrders(String orderType) async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.getOrders + orderType,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- get All Orders Vendor --->>>
  Future<Response> getAllOrdersVendor(String status,String pageNumber) async {
    final Response response = await baseDioHelper.get(
        endPoint: "${EndPoints.vendorAllOrders}$status&page_number=$pageNumber",
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- accept Order Vendor --->>>
  Future<Response> acceptOrderVendor({required String orderId}) async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.acceptOrder + orderId,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- refuse Order Vendor --->>>
  Future<Response> refuseOrderVendor({required String orderId}) async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.refuseOrder + orderId,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- start Mission Order Vendor --->>>
  Future<Response> startMissionOrderVendor({
    required String orderId,
    required double lat,
    required double lng,
  }) async {
    final Response response = await baseDioHelper.post(
        endPoint: EndPoints.startMissionOrder,
        data: {
          "order_id": orderId,
          "lat": lat.toString(),
          "lng": lng.toString(),
        },
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- service Steps Order Vendor --->>>
  Future<Response> serviceStepsOrderVendor({required String orderId,
    required String serviceId}) async {
    final Response response = await baseDioHelper.get(
        endPoint: "${EndPoints.serviceStepsOrder}$orderId&service_type=$serviceId",
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }

  /// <<<--- next Step Order Vendor --->>>
  Future<Response> nextStepOrderVendor({
    required NextStepModel nextStep
  }) async {
    final Response response = await baseDioHelper.post(
        endPoint: EndPoints.nextStep,
        data: nextStep.toJson(),
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }
}