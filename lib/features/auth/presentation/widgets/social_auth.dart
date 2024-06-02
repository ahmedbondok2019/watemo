import 'dart:io';
import '../../../../core/common/widgets/custom_social_login_bt.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GoogleLoginFailure) {
            CustomMessage.showMessage(context,
                message: NetworkExceptions.getErrorMessage(
                  state.networkExceptions,
                ),
                type: AlertType.failed);
          }
          else if (state is FacebookLoginFailure) {
            CustomMessage.showMessage(context,
                message: NetworkExceptions.getErrorMessage(
                  state.networkExceptions,
                ),
                type: AlertType.failed);
          }
          else if (state is AppleLoginFailure) {
            CustomMessage.showMessage(context,
                message: NetworkExceptions.getErrorMessage(
                  state.networkExceptions,
                ),
                type: AlertType.failed);
          }
          else if (state is GoogleLoginSuccess ||
              state is FacebookLoginSuccess ||
              state is AppleLoginSuccess) {
            context.read<AuthCubit>().clearData();
            Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.mainLayer,
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
      if (state is GoogleLoginLoading ||
          state is FacebookLoginLoading ||
          state is AppleLoginLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isIOS
                ? CustomSocialLoginBt(
              onTap: () {},
              title: "تسجيل بواسطة جوجل",
              image: ImageConstants.google,
            )
                : const SizedBox(),

            CustomSocialLoginBt(
              onTap: context.read<AuthCubit>().googleLogin,
              title: "تسجيل بواسطة جوجل",
              image: ImageConstants.google,
            ),

            CustomSocialLoginBt(
              onTap: () {},
              title: "تسجيل بواسطة فيسبوك",
              image: ImageConstants.facebook,
            ),
          ],
        );
      }
    });
  }
}