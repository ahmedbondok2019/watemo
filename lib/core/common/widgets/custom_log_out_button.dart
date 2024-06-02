import '../../src/app_export.dart';
import '../../utils/custom_message.dart';
import 'animated_custom_dialog.dart';
import 'confirm_order_dialog.dart';

class CustomLogOutButton extends StatelessWidget {
  final String? icon;
  final bool? showArrow;
  const CustomLogOutButton({super.key,
    this.icon,
    this.showArrow,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
        if (state is LogoutFailure) {
          CustomMessage.showMessage(context,
              message: NetworkExceptions.getErrorMessage(
                state.networkExceptions,
              ),
              type: AlertType.failed);
        }
        else if (state is LogoutSuccess) {
          CustomMessage.showMessage(context,
              message: state.message, type: AlertType.success);
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.initScreen, (route) => false);
        }
      },
        builder: (context, state) {
        if (state is LogOutLoading) {
          return MoreListTile(
            title: "تسجيل خروج",
            icon: icon ?? ImageConstants.logOut,
            showArrow: showArrow!,
            onTap: () async {
              showAnimatedDialog(context,
                  BlocBuilder<AuthCubit,
                      AuthState>(
                      builder: (context, state) {
                        return ConfirmOrderDialog(
                          description: "هل انت متاكد من انك تريد تسجيل خروج",
                          isFailed: false,
                          image: ImageConstants.said,
                          onTapConfirm: () {
                            context.read<AuthCubit>().logout();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.initScreen, (route) => false);
                          },
                        );
                      }),
                  dismissible: true, isFlip: true);
            },
          );
        }
        else {
          return MoreListTile(
            title: "تسجيل خروج",
            icon: icon ?? ImageConstants.logOut,
            showArrow: showArrow ?? true,
            onTap: () async {
              showAnimatedDialog(context,
                  BlocBuilder<AuthCubit,
                      AuthState>(
                      builder: (context, state) {
                        return ConfirmOrderDialog(
                          description: "هل انت متاكد من انك تريد تسجيل خروج",
                          isFailed: false,
                          image: ImageConstants.said,
                          onTapConfirm: () {
                            context.read<AuthCubit>().logout();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.initScreen, (route) => false);
                          },
                        );
                      }),
                  dismissible: true, isFlip: true);
            },
          );
        }
      });
  }
}
