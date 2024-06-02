import 'dart:developer';
import '../../../../core/src/app_export.dart';

class NotificationsDataSource {
  final BaseDioHelper baseDioHelper;
  NotificationsDataSource(this.baseDioHelper);

  Future<Response> getNotifications() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.notifications,
      token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    log("response123 =======>>>> ${response.data}");
    return response;
  }
}