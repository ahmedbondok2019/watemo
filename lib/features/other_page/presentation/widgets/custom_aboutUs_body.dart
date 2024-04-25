import '../../../../core/src/app_export.dart';

class CustomAboutUsBody extends StatelessWidget {
  const CustomAboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherPageCubit, OtherPageState>(
      builder: (context, state) {
        if (state is AboutUsLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        if (state is AboutUsSuccess) {
          return Column(
            children: [
              Gap(8.h),
              Image.asset(ImageConstants.logoSplash,
                  width: 89.w,height: 49.h),
              Gap(25.h),
              Text(
                context.read<OtherPageCubit>().aboutUsContent ?? "",
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w400,
                    color: AppColors.c9A9A9A,
                    height: 1.8,
                    size: 16),
              ),
            ],
          );
        }
        else {
          return const Center(
            child: CustomLoading(),
          );
        }
      },
    );
  }
}