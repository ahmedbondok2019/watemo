import '../../../../core/src/app_export.dart';
import 'custom_notification_card.dart';

class CustomNotificationsList extends StatelessWidget {
  const CustomNotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: NotificationsCubit.get(context).notificationsList.length,
      itemBuilder: (context, i) {
        final notification = NotificationsCubit.get(context).notificationsList[i];
        return CustomNotificationCard(
          title: notification.title ?? "",
          image: notification.image ?? "",
          subTitle: notification.description ?? "",
          date: notification.createdAt ?? "",
          isRead: notification.isRead ?? false,
        );
      },
    );
  }
}