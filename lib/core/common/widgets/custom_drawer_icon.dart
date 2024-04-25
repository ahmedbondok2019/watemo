import '../../src/app_export.dart';

class CustomDrawerIcon extends StatelessWidget {
  final void Function()? onPress;

  const CustomDrawerIcon(
      {Key? key,
      this.onPress,
      this.width,
      this.onTap,
      this.backgroundColor,
      this.height,
      this.imageColor})
      : super(key: key);
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? imageColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.cEDEDED),
          color: backgroundColor ?? AppColors.white.withOpacity(0.13),
        ),
        child: SvgPicture.asset(
          ImageConstants.drawerIcon,
          color: AppColors.black,
        ),
      ),
    );
  }
}
