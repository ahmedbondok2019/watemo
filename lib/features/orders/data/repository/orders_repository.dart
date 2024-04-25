import '../../../../core/src/app_export.dart';
import '../models/orders_res_model.dart';

class OrdersRepository {
  final OrdersDataSource _dataSource;

  OrdersRepository(this._dataSource);

  Future<NetworkService<OrdersResModel>> getOrders(String orderType) async {
    try {
      Response response = await _dataSource.getOrders(orderType);
      OrdersResModel orders = OrdersResModel.fromJson(response.data);
      return NetworkService.succeed(orders);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}
