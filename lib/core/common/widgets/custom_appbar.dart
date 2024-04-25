import '../../src/app_export.dart';

class CustomAppBar extends StatelessWidget {
  final double? height;

  const CustomAppBar(
      {super.key,
      this.height,
      this.actions,
      this.leading,
      this.title,
      this.paddingTop,
      this.paddingBottom,
      this.paddingLeft,
      this.paddingRight,
      this.titleSize,
      this.titleColor,
      });

  final List<Widget>? actions;
  final Widget? leading;
  final String? title;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingLeft;
  final double? paddingBottom;
  final double? titleSize;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: (paddingTop ?? 72).h,
        left: (paddingLeft ?? 15).w,
        right: (paddingRight ?? 15).w,
        bottom: (paddingBottom ?? 15).h
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // //todo: Leading
          leading ?? const CustomBackButton(),

          //todo :Title
          Padding(padding: EdgeInsets.only(top: 10.h),
          child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle(
              size: titleSize ?? 18,
              color: titleColor ?? AppColors.c090909,
              weight: FontWeight.w600,
            ),
            // textAlign: TextAlign.start,
          ),),

          //todo :Actions
          actions != null
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions!,
          )
              : SizedBox(width: 50.w),
        ],
      ),
    );
  }
}