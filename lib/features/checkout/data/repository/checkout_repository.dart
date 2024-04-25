import 'dart:developer';

import '../../../../core/common/models/reponse_model/response_model.dart';
import '../../../../core/src/app_export.dart';
import '../data_source/checkout_data_source.dart';
import '../models/check_code_res_model.dart';
import '../models/create_order/create_order_req_model.dart';

class CheckoutRepository {
  final CheckoutDataSource _dataSource;

  CheckoutRepository(this._dataSource);

  /// <<--- check Code request --->>
  Future<NetworkService<CheckCodeResModel>> checkCode(
      {required String code, required String serviceId}) async {
    try {
      Response? responseData =
      await _dataSource.checkCode(code: code, serviceId: serviceId);
      CheckCodeResModel checkCodeResModel = CheckCodeResModel.fromJson(responseData.data);
      log("id =====>>>>>>>${checkCodeResModel.codeDetails.id}");
      log("value =====>>>>>>>${checkCodeResModel.codeDetails.value}");
      return NetworkService.succeed(checkCodeResModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- create Order request --->>
  Future<NetworkService<ResponseModel>> createOrder({
        required CreateOrderReqModel order}) async {
    try {
      Response? responseData =
      await _dataSource.createOrder(order: order);
      ResponseModel responseModel = ResponseModel.fromJson(
          responseData.data);
      log("error =====>>>>>>>${responseModel.error}");
      return NetworkService.succeed(responseModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
