import '../../../../core/src/app_export.dart';
import '../widgets/custom_forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "title_forget_password".tr(context),
            ),
            const Expanded(
              child: CustomForgotPassword(),
            ),
          ],
        ),
      ),
    );
  }
}