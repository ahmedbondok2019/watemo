import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_edit_profile_company_body.dart';
import '../widgets/custom_edit_profile_user_body.dart';
import '../widgets/custom_edit_profile_vendor_body.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
             CustomAppBar(
              title: "تعديل الحساب",
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
                      AppConstants.userType ==  AppConstants.user
                          ? const CustomEditProfileUserBody()
                          : AppConstants.userType ==  AppConstants.vendor
                          ? const CustomEditProfileVendorBody()
                          : const CustomEditProfileCompanyBody(),
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