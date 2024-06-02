import '../../../../core/src/app_export.dart';

class TrackingOrderDataSource {
  final BaseDioHelper baseDioHelper;

  TrackingOrderDataSource(this.baseDioHelper);

  /// <<<---- get Order Tracking --->>>
  Future<Response> getOrderTracking(String orderId) async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.orderTrack + orderId,
      token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}