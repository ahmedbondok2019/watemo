import '../../../../core/src/app_export.dart';
import '../../../orders/data/models/vendor_order/vendor_orders_res_model.dart';
import '../models/home_model.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  /// <<<--- get Home user && company Data --->>>>
  Future<NetworkService<HomeModel>> getHomeData() async {
    try {
      Response response = await _homeDataSource.getHomeData();
      HomeModel homeData = HomeModel.fromJson(response.data);
      return NetworkService.succeed(homeData);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

  /// <<<--- get Home Vendor Data --->>>>
  Future<NetworkService<VendorOrdersResModel>> getHomeVendorData() async {
    try {
      Response response = await _homeDataSource.getHomeVendorData();
      VendorOrdersResModel homeData = VendorOrdersResModel.fromJson(response.data);
      return NetworkService.succeed(homeData);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}
