import '../../../../core/src/app_export.dart';
import '../data_source/tracking_order_data_source.dart';
import '../models/tracking_data_model.dart';

class TrackingOrderRepository {
  final TrackingOrderDataSource _dataSource;

  TrackingOrderRepository(this._dataSource);

  /// <<<---- get Order Tracking --->>>
  Future<NetworkService<TrackingDataModel>> getOrderTracking(
      String orderId) async {
    try {
      Response response = await _dataSource.getOrderTracking(orderId);
      TrackingDataModel trackingDataModel = TrackingDataModel.fromJson(response.data);
      return NetworkService.succeed(trackingDataModel);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}