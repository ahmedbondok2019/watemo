import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/my_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const HomeAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Gap(30.h),
                      MoreListTile(
                        title: "تعديل حسابي",
                        icon: ImageConstants.person,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "لغة التطبيق",
                        icon: ImageConstants.lang,
                        onTap: () => Navigator.pushNamed(context,
                            AppRoutes.selectLang,
                          arguments: true
                        ),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "المحفظة",
                        icon: ImageConstants.walletMoney,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.wallet),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),

                      /// don't wear ui
                      MoreListTile(
                        title: "الشهادات",
                        icon: ImageConstants.certifications,
                        onTap: () {},
                      ),


                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "دعوة صديق",
                        icon: ImageConstants.certifications,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.invitationFriend),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "عن التطبيق",
                        icon: ImageConstants.aboutApp,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.aboutUs),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "الشروط والاحكام",
                        icon: ImageConstants.info,
                        onTap: () => Navigator.pushNamed(context, AppRoutes.termConditions),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),
                      MoreListTile(
                        title: "الدعم الفني",
                        icon: ImageConstants.support,
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.contactUs),
                      ),
                      Divider(color: AppColors.cC4C4C4.withOpacity(0.5)),

                      logOutButtonWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BlocConsumer<AuthCubit, AuthState> logOutButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
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
    }, builder: (context, state) {
      if (state is LogOutInitial) {
        return MoreListTile(
          title: "تسجيل خروج",
          icon: ImageConstants.logOut,
          onTap: () async {
            showAnimatedDialog(context,
                BlocBuilder<AuthCubit,
                    AuthState>(
                    builder: (context, state) {
                      return MyDialog(
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
      } else if (state is LogOutLoading) {
        return MoreListTile(
          title: "تسجيل خروج",
          icon: ImageConstants.logOut,
          onTap: () async {
            showAnimatedDialog(context,
                BlocBuilder<AuthCubit,
                    AuthState>(
                    builder: (context, state) {
                      return MyDialog(
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
      } else {
        return MoreListTile(
          title: "تسجيل خروج",
          icon: ImageConstants.logOut,
          onTap: () async {
            showAnimatedDialog(context,
                BlocBuilder<AuthCubit,
                    AuthState>(
                    builder: (context, state) {
                      return MyDialog(
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