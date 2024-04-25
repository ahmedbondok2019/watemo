import '../../src/app_export.dart';

class CustomButtonInternet extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final double? width;
  final double? height;
  final double? vertical;
  final double? horizontal;
  final FontWeight? weight;
  final double? size;
  final Color? colorBg;
  final Color? txtColor;
  final Color? borderColor;

  const CustomButtonInternet(
      {super.key, this.onTap,this.weight,
        this.title, this.width,this.horizontal,this.vertical,
        this.txtColor, this.colorBg,this.borderColor,
        this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(
            vertical: (vertical ?? 24).h,
            horizontal: (horizontal ?? 16).w),
        width: (width ?? 145).w,
        height: (height ?? 48).h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorBg ?? AppColors.cBEA235,
          borderRadius: BorderRadius.circular(8.r),
          border: borderColor == null
              ? null
              : Border.all(color: borderColor!)
        ),
        child: Text(
          title ?? 'إعادة المحاولة',
          style: AppTextStyles.textStyle(
            color: txtColor ?? AppColors.white,
            size: size ?? 16,
            weight: weight ?? FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
