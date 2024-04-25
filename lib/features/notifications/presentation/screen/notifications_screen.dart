import '../../../../core/src/app_export.dart';
import '../widgets/custom_notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "الاشعارات",
              titleSize: 16,
              leading: CustomBackButton(),
            ),

            BlocProvider<NotificationsCubit>(
                create: (context) => getIt<NotificationsCubit>()
                  ..getNotifications(),
                child: BlocBuilder<NotificationsCubit, NotificationsState>(
                  builder: (context, state) {
                    if (state is NotificationsLoading) {
                      return const Expanded(
                        child: CustomLoading(),);
                    }
                    if (state is NotificationsSuccess) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const CustomNotificationsList(),
                          ),
                        ),
                      );
                    }
                    else {
                      return const Expanded(
                        child: CustomLoading(),);
                    }
                  },
                ),
            ),
          ],
        )
      ),
    );
  }
}
