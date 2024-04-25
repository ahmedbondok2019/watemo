import '../../../../core/src/app_export.dart';
import '../widgets/otp_number.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  const OtpScreen({super.key,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "رمز التحقق",
            ),
            Expanded(
              child: OtpNumber(
                  phone: phone
              ),
            ),
          ],
        ),
      ),
    );
  }
}
