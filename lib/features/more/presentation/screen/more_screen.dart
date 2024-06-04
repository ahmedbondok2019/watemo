import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_log_out_button.dart';
import '../../../../core/src/app_export.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});
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
            HomeAppBar(scaffoldKey: _scaffoldKey),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Gap(30.h),
                      MoreListTile(
                        title: "edit_profile".tr(context),
                        icon: ImageConstants.person,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "app_lang".tr(context),
                        icon: ImageConstants.lang,
                        onTap: () => Navigator.pushNamed(context,
                            AppRoutes.selectLang,
                          arguments: true
                        ),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "wallet".tr(context),
                        icon: ImageConstants.walletMoney,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.wallet),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),

                      /// don't wear ui
                      MoreListTile(
                        title: "certificates".tr(context),
                        icon: ImageConstants.certifications,
                        onTap: () {},
                      ),


                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "invite_friend".tr(context),
                        icon: ImageConstants.certifications,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.invitationFriend),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "about_app".tr(context),
                        icon: ImageConstants.aboutApp,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.aboutUs),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "term&&condition".tr(context),
                        icon: ImageConstants.info,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.termConditions),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "technical_support".tr(context),
                        icon: ImageConstants.support,
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.contactUs),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),

                      const CustomLogOutButton(),
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