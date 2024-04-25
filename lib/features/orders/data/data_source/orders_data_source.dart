import '../../../../core/src/app_export.dart';

class OrdersDataSource {
  final BaseDioHelper baseDioHelper;
  OrdersDataSource(this.baseDioHelper);

  Future<Response> getOrders(String orderType) async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.getOrders + orderType,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }
}