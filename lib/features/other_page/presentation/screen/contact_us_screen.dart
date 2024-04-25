import '../../../../core/src/app_export.dart';
import '../widgets/custom_contactUs_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const CustomAppBar(
            title: "تواصل معنا",
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
                    const CustomContactUsBody(),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
