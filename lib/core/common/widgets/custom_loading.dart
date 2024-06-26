import 'package:lottie/lottie.dart';

import '../../src/app_export.dart';

class CustomLoading extends StatelessWidget {
  final double? width;
  final double? height;
  const CustomLoading({super.key,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(ImageConstants.loading,
      width: (width ?? 120).w,height: (height ?? 120).h));
  }
}
