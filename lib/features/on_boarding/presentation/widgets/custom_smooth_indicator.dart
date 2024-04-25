import '../../../../core/src/app_export.dart';

class CustomSmoothIndicator extends StatelessWidget {
  final PageController controller;
  const CustomSmoothIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 5.w,
        dotWidth: 10.w,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}
