import 'package:completed/core/src/app_export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ImageConstants.noInternet, width: 100),
            Text(
              'noInternetHeader'.tr(context),
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Color(0xff042030),
              ),
            ),
            Text(
              'noInternetBody'.tr(context),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF858585),
              ),
            ),
            const SizedBox(height: 16),
            CustomButtonInternet(
              title: 'tryAgain'.tr(context),
              onTap: () async {
                /// Check for internet connectivity
                var connectivityResult = await Connectivity().checkConnectivity();
                if (connectivityResult == ConnectivityResult.none) {
                  // Show a SnackBar indicating no internet connectivity
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("noInternetHeader".tr(context)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  // Internet is available, navigate to the SplashScreen
                  Navigator.pushNamed(context,AppRoutes.initScreen);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
