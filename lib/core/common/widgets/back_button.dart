import '../../src/app_export.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.image,
    this.widthImage,
    this.heightImager,
  });

  final void Function()? onTap;
  final Color? backgroundColor;
  final Widget? image;
  final double? widthImage;
  final double? heightImager;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
              () => Navigator.pop(context),
      child: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.cEDEDED),
          color: backgroundColor ?? AppColors.white.withOpacity(0.13),
        ),
        child: SvgPicture.asset(
          ImageConstants.arrowBack,
          color: AppColors.black,
          width: 5.w,height: 1.h,
        ),
      ),
    );
  }
}
