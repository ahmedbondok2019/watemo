import 'dart:developer';
import '../../../core/common/models/reponse_model/response_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/create_order/create_order_req_model.dart';
import '../data/repository/checkout_repository.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepository _repository;
  CheckoutCubit(this._repository) : super(CheckoutInitial());
  static CheckoutCubit get(BuildContext context) => BlocProvider.of<CheckoutCubit>(context);
  TextEditingController codeController = TextEditingController();
  int paymentType = 0;

  void changePaymentType(int type) {
    emit(ChangePaymentTypeLoading());
    paymentType = type;
    emit(ChangePaymentType(paymentType: paymentType));
  }

  /// <<--- create Order request --->>
  Future createOrder({required CreateOrderReqModel order}) async {
    log("services ==========>>>>>> ${order.services}");
    log("onBehalfOf ==========>>>>>> ${order.onBehalfOf}");
    log("userRelation ==========>>>>>> ${order.userRelation}");
    log("languages ==========>>>>>> ${order.languages}");
    log("sex ==========>>>>>> ${order.sex}");
    log("notes ==========>>>>>> ${order.notes}");
    emit(CreateOrderLoading());
    order.paymentMethod =
    paymentType == 0
        ? "mada"
        : paymentType == 1
        ? "visa"
        : "wallet";
    log("paymentMethod ==========>>>>>> ${order.paymentMethod}");
    final NetworkService<ResponseModel> data =
    await _repository.createOrder(order: order);
    data.when(
      succeed: (responseData) {
        emit(CreateOrderSuccess(message: responseData.error.toString()));
      },
      failure: (error) {
        emit(CreateOrderFailure(networkExceptions: error));
      },
    );
  }
}