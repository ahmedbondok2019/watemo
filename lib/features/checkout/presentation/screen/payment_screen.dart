import 'dart:async';
import 'package:completed/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/common/widgets/back_button.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/main_background.dart';
import '../../../../core/common/widgets/notification_icon.dart';
import '../../../../core/routes/app_router.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  const PaymentScreen({super.key,required this.url});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    print("url =====>>>> ${widget.url}");
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print("onPageStarted =====>>>> ${url}");
            if(url.contains("https://atemoo.com/")){
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.mainLayer, (route) => false);
            }
          },
          onProgress: (int progress) {
            print("onProgress =====>>>> ${progress}");
            // Update loading bar.
          },
          onPageFinished: (String url) {
            print("onPageFinished =====>>>> ${url}");
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        body: BackgroundComponent(
            opacity: 0.2,
            child: Column(
              children: [
                CustomAppBar(
                  title: "confirm_order".tr(context),
                  titleSize: 16,
                  leading: CustomBackButton(
                    onTap: () => _exitApp(context)
                  ),
                  actions: const [NotificationIcon()],
                ),
                Expanded(
                    child: WebViewWidget(controller: _controller)
                ),
              ],
            )),
      )
    );
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    }
    else {
      // AppNavigator.navigateTo(context: context,
      //     screen: const DashBoardScreen());
      return Future.value(true);
    }
  }
}