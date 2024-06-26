import '../../../../core/src/app_export.dart';

class CustomTermBody extends StatelessWidget {
  const CustomTermBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(8.h),
        Text(
          context.read<OtherPageCubit>().termsContent ?? "",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w500,
              color: AppColors.c9A9A9A,
              height: 1.8,
              size: 11),
        ),
      ],
    );
  }
}