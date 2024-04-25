import '../../src/app_export.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(ImageConstants.loading,
      width: 120.w,height: 120.h,));
  }
}
