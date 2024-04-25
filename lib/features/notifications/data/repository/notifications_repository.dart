import '../../../../core/src/app_export.dart';
import '../models/notifications_res_model.dart';

class NotificationsRepository {
  final NotificationsDataSource _dataSource;
  NotificationsRepository(this._dataSource);

  Future<NetworkService<NotificationResModel>> getNotifications() async {
    try {
      Response response = await _dataSource.getNotifications();
      NotificationResModel notificationRes = NotificationResModel.fromJson(response.data);
      return NetworkService.succeed(notificationRes);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}
