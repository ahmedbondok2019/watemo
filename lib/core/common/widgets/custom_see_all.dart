import '../../src/app_export.dart';

class CustomSeeAll extends StatelessWidget {
  const CustomSeeAll({
    super.key,
    required this.onTap,
    required this.title,
  });

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyle(
              size: 16, weight: FontWeight.w600, color: AppColors.c090909),
        ),
        GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'عرض الكل',
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w400,
                      size: 14,
                      color: AppColors.primary),
                ),
                Gap(8.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.w,
                  color: AppColors.primary,
                )
              ],
            )),
      ],
    );
  }
}
