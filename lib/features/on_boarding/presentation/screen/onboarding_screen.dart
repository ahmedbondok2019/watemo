import '../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/on_boarding_cubit.dart';
import '../../cubit/on_boarding_state.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
      return Scaffold(
        body: BackgroundComponent(
          opacity: 0.2,
          child: Padding(
            padding: EdgeInsets.only(
              top: 70.h,
              left: 15.h,
              right: 15.h,
              bottom: 15.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    onBoardingCubit.currentIndex ==
                            onBoardingCubit.onBoardingData.length - 1
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.authScreen,
                            ),
                            child: Text(
                              "تخطي",
                              style: AppTextStyles.textStyle(
                                color: AppColors.c090909,
                                weight: FontWeight.w700,
                                size: 16,
                              ),
                            ),
                          ),

                    BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, state) {
                      return CustomDropDown(
                        buttonWidth: double.infinity,
                        list: LocalizationBloc.get(context).langList,
                        selectedItem: LocalizationBloc.get(context)
                            .langList[LocalizationBloc.get(context).lang],
                      );
                    }),
                  ],
                ),

                Gap(38.h),
                OnBoardingBody(
                    onChange: onBoardingCubit.updateIndex,
                    pageController: onBoardingCubit.pageController),
                Gap(20.h),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onBoardingCubit.pageController.previousPage(
                            duration: const Duration(microseconds: 200),
                            curve: Curves.bounceIn);
                      },
                      child: Text(
                        "السابق",
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: onBoardingCubit.currentIndex == 0
                                ? AppColors.c9A9A9A
                                : AppColors.c090909,
                            size: 16),
                      ),
                    ),
                    CustomSmoothIndicator(
                        controller: onBoardingCubit.pageController),
                    GestureDetector(
                      onTap: () {
                        onBoardingCubit.pageController.nextPage(
                            duration: const Duration(microseconds: 200),
                            curve: Curves.bounceIn);
                      },
                      child: Text(
                        "التالي",
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: onBoardingCubit.currentIndex ==
                                    onBoardingCubit.onBoardingData.length - 1
                                ? AppColors.c9A9A9A
                                : AppColors.c090909,
                            size: 16),
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                onBoardingCubit.currentIndex ==
                        onBoardingCubit.onBoardingData.length - 1
                    ? CustomButtonInternet(
                        title: AppConstants.userType ==  AppConstants.user
                            ? "ابدأ التسجيل كطالب خدمة الان"
                            : "ابدأ الاستخدام الان",
                        horizontal: 0,
                        vertical: 10,
                        width: MediaQuery.of(context).size.width,
                        onTap: () => Navigator.pushReplacementNamed(context,
                          AppRoutes.authScreen,
                        ),
                      )
                    : const SizedBox(),
                Gap(20.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
