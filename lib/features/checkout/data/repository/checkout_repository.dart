import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../data_source/checkout_data_source.dart';
import '../models/checkout_order/checkout_model.dart';
import '../models/create_order/create_order_req_model.dart';

class CheckoutRepository {
  final CheckoutDataSource _dataSource;

  CheckoutRepository(this._dataSource);

  /// <<--- create Order request --->>
  Future<NetworkService<CheckoutModel>> createOrder({
        required CreateOrderReqModel order}) async {
    try {
      Response? responseData =
      await _dataSource.createOrder(order: order);
      CheckoutModel resp = CheckoutModel.fromJson(
          responseData.data);
      return NetworkService.succeed(resp);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
