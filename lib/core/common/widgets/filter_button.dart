
import '../../src/app_export.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {Key? key,
        this.onTap,
        this.bgColor,
        this.iconColor,
        this.hasShadow = false,
        this.hasBorder = true,
        this.width,
        this.height,
        this.imageSize})
      : super(key: key);
  final GestureTapCallback? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final bool? hasShadow;
  final bool? hasBorder;
  final double? width;
  final double? height;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        width: (width ?? 62).w,
        height: (height ?? 62).h,
        decoration: BoxDecoration(
          border: hasBorder == true
              ? Border.all(width: 2.w, color: const Color(0xFFE1E1E1))
              : null,
          // color: bgColor ?? const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
          gradient: const LinearGradient(
              colors: [
                AppColors.cF6E5C3,
                AppColors.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                1,
              ],
              tileMode: TileMode.clamp,
          ),
          boxShadow: hasShadow == true
              ? [
            const BoxShadow(
                color: AppColors.primary, spreadRadius: 0, blurRadius: 9)
          ]
              : [],
        ),
        child: Image.asset(
          ImageConstants.bookFilter,
          color: AppColors.white,
          width: (imageSize??26).w,
          height: (imageSize??26).w,
        ),
      ),
    );
  }
}
