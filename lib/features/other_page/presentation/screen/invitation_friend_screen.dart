import '../../../../core/src/app_export.dart';
import '../widgets/custom_invite_body.dart';

class InvitationFriendScreen extends StatelessWidget {
  const InvitationFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "دعوة صديق",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Column(
                    children: [
                      Gap(15.h),
                      const CustomInviteBody(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}