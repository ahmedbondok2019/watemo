import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_privacy_body.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppConstants.userType == AppConstants.user ||
          AppConstants.userType == AppConstants.company
          ? null
          : const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "privacy_policy".tr(context),
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

            BlocBuilder<OtherPageCubit, OtherPageState>(
              builder: (context, state) {
                if (state is PrivacyLoading) {
                  return const Expanded(
                    child: CustomLoading());
                }
                if (state is PrivacySuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Gap(15.h),
                            const CustomPrivacyBody(),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return const Expanded(
                    child: CustomLoading());
                }
              },
            ),
          ],
        )
      ),
    );
  }
}
