import '../../../../core/src/app_export.dart';

class TabBarTab extends StatelessWidget {
  const TabBarTab({
    Key? key,
    required this.label,
    required this.icon,
    this.iconColor,
    this.height,
    this.width,
  }) : super(key: key);

  final String label;
  final String icon;
  final Color? iconColor;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: iconColor,
          height: (height ?? 24).h,
          width: (width ?? 24).w,
        ),
        Gap(4.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AutoSizeText(label,
            maxLines: 1,
            style: AppTextStyles.textStyle(
                size: 16, weight: FontWeight.w600,
                color: iconColor),
            group: AutoSizeGroup(),
          ),
        )
      ],
    );
  }
}