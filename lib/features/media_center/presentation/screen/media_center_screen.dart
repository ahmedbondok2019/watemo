import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_profile_image.dart';
import '../../../../core/src/app_export.dart';

class MediaCenterScreen extends StatelessWidget {
  MediaCenterScreen({super.key});
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
              title: "المركز الاعلامي",
              titleSize: 16,
              leading: const CustomProfileImage(),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.r,
                    vertical: 10.r,
                  ),
                  child: Column(
                    children: [
                      Gap(20.h),
                      Image.asset(ImageConstants.logoSplash,
                        width: 132.w,
                        height: 73.h,
                      ),
                      Gap(30.h),

                      _typeWidget(
                          title: "احاديث نبويه",
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.hadith)),

                      _typeWidget(
                          title: "فيديوهات",
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.videos)),

                      _typeWidget(title: "اسئلة شائعه",
                          onTap: () => Navigator.pushNamed(context, AppRoutes.faqs)),
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

  Widget _typeWidget({required String title, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 361.w,
        height: 48.h,
        margin: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: AppColors.cFBFBFB,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.cE3E3E3,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle(
                size: 16,
                color: AppColors.c090909,
                weight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
                ImageConstants.arrowBackLeft,
              width: 16.w,
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
