import '../../../../core/src/app_export.dart';

class ListTileDrawer extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const ListTileDrawer({super.key,
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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.symmetric(vertical: 5.w),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
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
      ),
    );
  }
}
