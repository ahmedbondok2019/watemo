import 'package:lottie/lottie.dart';

import '../../src/app_export.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key , this.size});
 final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        fit: BoxFit.cover,
          width: (size ??200).w,
          height: (size ??200).h,
          'assets/lottie/loader.json',
      ),
    );
  }
}
