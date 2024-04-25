import '../../../../core/src/app_export.dart';
import '../../cubit/on_boarding_cubit.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController pageController;

  final Function(int)? onChange;
  const OnBoardingBody(
      {super.key, required this.onChange, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      width: double.infinity,
      child: PageView.builder(
        onPageChanged: onChange,
        controller: pageController,
        itemCount: OnBoardingCubit.get(context).onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 315.w,
                width: 400.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      OnBoardingCubit.get(context).onBoardingData[index].imagePath,
                    ),
                  ),
                ),
              ),
              Text(
                OnBoardingCubit.get(context).onBoardingData[index].title,
                style: AppTextStyles.textStyle(
                  color: AppColors.c090909,
                  weight: FontWeight.w700,
                  size: 24,
                ),
              ),
              Gap(20.h),
              Text(
                OnBoardingCubit.get(context).onBoardingData[index].subTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(
                  size: 16,
                  weight: FontWeight.w400,
                  color: AppColors.c090909,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
