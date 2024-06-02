import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_contactUs_body.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: AppConstants.userType == AppConstants.user ||
            AppConstants.userType == AppConstants.company
            ? null
            : _scaffoldKey,
        drawer: AppConstants.userType == AppConstants.user ||
            AppConstants.userType == AppConstants.company
            ? null
            : const CustomAppDrawer(),
      body: Column(
        children: [
          CustomAppBar(
            title: "تواصل معنا",
            titleSize: 16,
            leading: const CustomBackButton(),
            actions: [
              AppConstants.userType == AppConstants.user ||
                  AppConstants.userType == AppConstants.company
                  ? const NotificationIcon()
                  : CustomDrawerIcon(
                onTap: ()=> _scaffoldKey.currentState?.openDrawer(),
              ),
            ],
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
