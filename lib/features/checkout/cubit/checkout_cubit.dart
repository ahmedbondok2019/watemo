import 'dart:developer';
import '../../../core/common/models/reponse_model/response_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/check_code_model.dart';
import '../data/models/check_code_res_model.dart';
import '../data/models/create_order/create_order_req_model.dart';
import '../data/repository/checkout_repository.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepository _repository;
  CheckoutCubit(this._repository) : super(CheckoutInitial());
  static CheckoutCubit get(BuildContext context) => BlocProvider.of<CheckoutCubit>(context);
  TextEditingController codeController = TextEditingController();
  int paymentType = 0;
  String? code;
  CheckCodeModel? checkCodeDetails;

  void changePaymentType(int type) {
    emit(ChangePaymentTypeLoading());
    paymentType = type;
    emit(ChangePaymentType(paymentType: paymentType));
  }

  /// <<--- check Code request --->>
  Future checkCode(String serviceId) async {
    code = codeController.text.trim();
    emit(CheckCodeLoading());
    final NetworkService<CheckCodeResModel> data =
    await _repository.checkCode(
      code: codeController.text.trim(),
      serviceId: serviceId
    );
    data.when(
      succeed: (responseData) {
        checkCodeDetails = responseData.codeDetails;
        emit(CheckCodeSuccess());
      },
      failure: (error) {
        emit(CheckCodeFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- create Order request --->>
  Future createOrder({required CreateOrderReqModel order}) async {
    log("serviceId ==========>>>>>> ${order.serviceId}");
    log("onBehalfOf ==========>>>>>> ${order.onBehalfOf}");
    log("userRelation ==========>>>>>> ${order.userRelation}");
    log("vendorId ==========>>>>>> ${order.vendorId}");
    log("notes ==========>>>>>> ${order.notes}");
    log("requiredDate ==========>>>>>> ${order.requiredDate}");
    emit(CreateOrderLoading());
    order.paymentMethod =
    paymentType == 0
        ? "mada"
        : paymentType == 1
        ? "visa"
        : "wallet";
    log("paymentMethod ==========>>>>>> ${order.paymentMethod}");
    log("code ==========>>>>>> ${order.code}");
    final NetworkService<ResponseModel> data =
    await _repository.createOrder(order: order);
    data.when(
      succeed: (responseData) {
        emit(CreateOrderSuccess());
      },
      failure: (error) {
        emit(CreateOrderFailure(networkExceptions: error));
      },
    );
  }
}