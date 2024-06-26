import '../../../../core/src/app_export.dart';

class CustomAboutUsBody extends StatelessWidget {
  const CustomAboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(8.h),
        Image.asset(ImageConstants.logoSplash,
          width: 132.w,
          height: 73.h,
        ),
        Gap(25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          context.read<OtherPageCubit>().aboutUsContent ?? "",
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle(
              weight: FontWeight.w500,
              color: AppColors.c9A9A9A,
              height: 1.5,
              size: 16),
        ),)
      ],
    );
  }
}