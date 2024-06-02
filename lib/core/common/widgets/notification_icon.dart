import '../../src/app_export.dart';

class NotificationIcon extends StatelessWidget {
  final Color? backgroundColor;
  const NotificationIcon({
    Key? key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, AppRoutes.notifications),
      child: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.cEDEDED),
          color: backgroundColor ?? AppColors.white.withOpacity(0.13),
        ),
        child: Stack(
          children: [
            SvgPicture.asset(
              ImageConstants.notification,
              color: AppColors.black,
            ),
            Positioned(
              top: 1.h,right: 5.w,
                child: Container(
              width: 8.w,
              height: 8.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cE74C3C,
              ),
            ))
          ],
        ),
      ),
    );
  }
}