import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';

class SelectLangScreen extends StatelessWidget {
  final bool isEdit;
  SelectLangScreen({super.key,this.isEdit = false});
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            isEdit
                ? CustomAppBar(
              title: "edit_lang".tr(context),
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
            )
                : const SizedBox(),

            isEdit
                ? Gap(10.h)
                : Gap(110.h),

            Image.asset(
              ImageConstants.logoSplash,
              fit: BoxFit.contain,
              width: 132.w,
              height: 72.h,
            ),

            Gap(30.h),
            Center(
              child: Text(
                "select_lang".tr(context),
                style: AppTextStyles.textStyle(
                    size: 24,
                  weight: FontWeight.w700,
                  color: AppColors.c090909
                ),
              ),
            ),
            Gap(10.h),
            Center(
              child: Text(
                "please_select_lang".tr(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(
                    size: 14,
                    weight: FontWeight.w400,
                    color: AppColors.c090909
                ),
              ),
            ),
            Gap(20.h),
            const SelectLang(),

            const Spacer(),
            CustomButtonInternet(
              title: isEdit
                  ? "save_edit".tr(context)
                  : "next".tr(context),
              width: MediaQuery.of(context).size.width,
              onTap: ()=> isEdit
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(
                  context,
                  AppRoutes.selectUserType),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
