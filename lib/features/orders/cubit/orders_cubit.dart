import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../data/models/orders_model.dart';
import '../data/models/orders_res_model.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository _repository;
  OrdersCubit(
      this._repository,
      ) : super(OrdersIdle());

  static OrdersCubit get(context) => BlocProvider.of<OrdersCubit>(context);

  int orderType = 0;

  void changeOrderType(int type) {
    emit(ChangeOrderTypeLoading());
    orderType = type;
    getOrders();
    emit(ChangeOrderType(orderType: orderType));
  }

  List<List<OrdersModel>> ordersList = [];
  List<String> ordersDateList = [];

  Future<void> getOrders() async {
    log("message ======================>>>>>>>>>>>>333");
    emit(OrdersLoading());
    final NetworkService<OrdersResModel> data =
    await _repository.getOrders(orderType.toString());
    switch (data) {
      case Succeed<OrdersResModel>(data: OrdersResModel data):
        emit(OrdersSuccess());
        ordersDateList.clear();
        ordersList.clear();
        data.orders.forEach((key, value) {
          ordersDateList.add(key);
          List<OrdersModel> orders =
          List<OrdersModel>.from(value.map((x) => OrdersModel.fromJson(x)));
          ordersList.add(orders);
        });

      case Failure<OrdersResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(OrdersFailed(networkExceptions: error));
    }
  }
}