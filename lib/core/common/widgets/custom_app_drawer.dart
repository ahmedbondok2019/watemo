import 'package:completed/core/common/general_cubit/user/user_cubit.dart';
import '../../src/app_export.dart';
import 'custom_log_out_button.dart';
import 'custom_profile_image.dart';
import 'list_tile_drawer.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 279.w,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                height: 80.h,
                width: 393.w,
                margin: EdgeInsets.only(left: 15.w,
                    right: 15.w, top: 72.h,bottom: 10.h
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CustomProfileImage(),
                  visualDensity: const VisualDensity(horizontal: -3,vertical: 0),
                  title: Row(
                    children: [
                      SizedBox(
                          width: 160.w,
                          child: Text(
                            "${"hello".tr(context)} ${context.read<UserCubit>().user!.name ?? ""} ",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: AppTextStyles.textStyle(
                                weight: FontWeight.w600,
                                color: AppColors.c090909,
                                size: 16),
                          )),
                      Image.asset(ImageConstants.hand, width: 18.w, height: 18.h)
                    ],
                  ),
                  subtitle: Text(
                    "happy_to_see".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w600,
                        color: AppColors.c090909,
                        // color: AppColors.c9A9A9A,
                        size: 12),
                  ),
                )),

            Column(
              children: [
                /// home
                ListTileDrawer(
                  title: "main".tr(context),
                  icon: ImageConstants.homeDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.homeScreen),
                ),

                /// edit profile
                ListTileDrawer(
                  title: "edit_profile".tr(context),
                  icon: ImageConstants.personDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.profile),
                ),

                /// wallet
                ListTileDrawer(
                  title: "wallet".tr(context),
                  icon: ImageConstants.walletDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.wallet),
                ),

                /// notification
                ListTileDrawer(
                  title: "notifications".tr(context),
                  icon: ImageConstants.notificationDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.notifications),
                ),

                /// aboutApp
                ListTileDrawer(
                  title: "about_app".tr(context),
                  icon: ImageConstants.aboutAppDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.aboutUs),
                ),

                /// term use
                ListTileDrawer(
                  title: "term_use".tr(context),
                  icon: ImageConstants.termDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.termConditions),
                ),

                /// term use
                ListTileDrawer(
                  title: "contact_us".tr(context),
                  icon: ImageConstants.contactDrawer,
                  onTap: () => Navigator.pushNamed(context,
                      AppRoutes.contactUs),
                ),

                Gap(230.h),
                /// LOG OUT
                const CustomLogOutButton(
                  icon: ImageConstants.logoutDrawer,
                  showArrow: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}