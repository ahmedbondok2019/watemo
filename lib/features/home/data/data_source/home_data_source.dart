import '../../../../core/src/app_export.dart';

class HomeDataSource {
  final BaseDioHelper baseDioHelper;

  HomeDataSource(this.baseDioHelper);

  /// <<<--- get Home user && company Data --->>>>
  Future<Response> getHomeData() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.home,
      token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<<--- get Home Vendor Data --->>>>
  Future<Response> getHomeVendorData() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.vendorOrders,
      token: getIt<SharedPreferences>().getString(
          AppConstants.token)
    );
    return response;
  }
}