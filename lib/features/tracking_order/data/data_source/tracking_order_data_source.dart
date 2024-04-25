import '../../../../core/src/app_export.dart';

class TrackingOrderDataSource {
  final BaseDioHelper baseDioHelper;

  TrackingOrderDataSource(this.baseDioHelper);

  /// <<<---- get Order Location --->>>
  Future<Response> getOrderLocation(String orderId) async {
    final Response response = await baseDioHelper.post(
      endPoint: EndPoints.orderLocation,
      data: {
        "order_id": orderId
      },
      token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}