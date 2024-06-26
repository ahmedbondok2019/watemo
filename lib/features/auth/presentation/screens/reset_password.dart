import '../../../../core/src/app_export.dart';
import '../widgets/enter_new_password.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "new_password".tr(context),
            ),
            const Expanded(
              child: EnterNewPassword(),
            ),
          ],
        ),
      ),
    );
  }
}
