import '../../../../core/src/app_export.dart';
import '../widgets/enter_new_password.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "كلمة مرور جديدة",
            ),
            Expanded(
              child: EnterNewPassword(),
            ),
          ],
        ),
      ),
    );
  }
}
