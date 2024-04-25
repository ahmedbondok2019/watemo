import '../../../../core/src/app_export.dart';

class MoreListTile extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const MoreListTile({super.key,
  required this.icon,
  required this.title,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        width: 363.w,
        height: 49.h,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  child: SvgPicture.asset(icon, width: 24.w,
                      height: 24.h),
                ),
                Gap(10.w),
                Text(
                  title,
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w500,
                      color: AppColors.c090909, size: 14),
                ),
              ],
            ),

            SvgPicture.asset(ImageConstants.arrowBackLeft,
                width: 24.w,
                height: 24.h),
          ],
        ),
      ),
    );
  }
}
