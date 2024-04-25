import 'dart:developer';

import '../../../../core/src/app_export.dart';
import '../models/create_order/create_order_req_model.dart';

class CheckoutDataSource {
  final BaseDioHelper baseDioHelper;

  CheckoutDataSource(this.baseDioHelper);

  /// <<--- check Code request --->>
  Future<Response> checkCode(
      {required String code, required String serviceId}) async {
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.validCouponCode,
        data: {
      "code": code,
      "service_id": serviceId,
    },
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }

  /// <<--- create Order request --->>
  Future<Response> createOrder({required CreateOrderReqModel order}) async {
    final Response response =
    await baseDioHelper.post(
      endPoint: EndPoints.createOrder,
      data: order.toJson(),
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    log("response =====>>>>>>>${response.data}");
    return response;
  }
}