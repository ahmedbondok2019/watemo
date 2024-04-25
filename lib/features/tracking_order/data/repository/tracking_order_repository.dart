import '../../../../core/src/app_export.dart';
import '../data_source/tracking_order_data_source.dart';
import '../models/tracking_data_model.dart';

class TrackingOrderRepository {
  final TrackingOrderDataSource _dataSource;

  TrackingOrderRepository(this._dataSource);

  /// <<<---- get Order Location --->>>
  Future<NetworkService<TrackingDataModel>> getOrderLocation(
      String orderId) async {
    try {
      Response response = await _dataSource.getOrderLocation(orderId);
      TrackingDataModel trackingDataModel = TrackingDataModel.fromJson(response.data);
      return NetworkService.succeed(trackingDataModel);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}