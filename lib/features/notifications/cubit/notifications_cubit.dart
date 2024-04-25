import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../data/models/notification_model.dart';
import '../data/models/notifications_res_model.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository _repository;
  NotificationsCubit(
      this._repository,
      ) : super(NotificationsIdle());

  static NotificationsCubit get(context) => BlocProvider.of<NotificationsCubit>(context);

  List<NotificationModel> notificationsList = [];

  Future<void> getNotifications() async {
    log("message ======================>>>>>>>>>>>>333");
    emit(NotificationsLoading());
    final NetworkService<NotificationResModel> data = await _repository.getNotifications();
    switch (data) {
      case Succeed<NotificationResModel>(data: NotificationResModel data):
        emit(NotificationsSuccess());
        notificationsList.addAll(data.notifications);
      case Failure<NotificationResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(NotificationsFailed(networkExceptions: error));
    }
  }
}