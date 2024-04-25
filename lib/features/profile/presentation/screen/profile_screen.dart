import '../../../../core/src/app_export.dart';
import '../widgets/custom_edit_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "تعديل الحساب",
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
                      const CustomEditProfileBody(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
