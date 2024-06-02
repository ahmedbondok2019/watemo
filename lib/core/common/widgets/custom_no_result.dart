import '../../src/app_export.dart';

class CustomNoResult extends StatelessWidget {
  final String title;
  const CustomNoResult({Key? key,
    this.mainAxisAlignment,
    required this.title,
  }) : super(key: key);
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            ImageConstants.resultImage,
          width: 150.w,
          height: 150.h,
        ),
        Gap(20.h),
        Text(
          title,
          style: AppTextStyles.textStyle(
            color: AppColors.c00243C,
            size: 16,
            weight: FontWeight.w700,
          ),
        ),
        Gap(3.h),
      ],
    );
  }
}
