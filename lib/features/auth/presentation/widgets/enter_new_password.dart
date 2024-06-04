import '../../../../core/src/app_export.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({super.key});
  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}
class _EnterNewPasswordState extends State<EnterNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        child: Form(
          key: context.read<AuthCubit>().formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Gap(18.h),
              Text(
                "reset_password_title".tr(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(
                  size: 16,
                  weight: FontWeight.w700,
                  color: AppColors.c090909,
                ),
              ),

              Gap(35.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "password".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(15.h),
                  InputFormField(
                    controller: context.read<AuthCubit>().passwordController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "empty_password_validation".tr(context);
                      } else if (p0.length < 8) {
                        return "password_validation".tr(context);
                      }
                      return null;
                    },
                    secure: true,
                    fillColor: AppColors.cF5F5F5,
                    hint: "***********",
                  ),
                  Gap(25.h),

                  Text(
                    "confirm_password".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(15.h),
                  InputFormField(
                    controller: context.read<AuthCubit>().confirmPasswordController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "empty_password_validation".tr(context);
                      } else if (p0.length < 8) {
                        return "password_validation".tr(context);
                      } else if (context
                          .read<AuthCubit>()
                          .passwordController
                          .text !=
                          context
                              .read<AuthCubit>()
                              .confirmPasswordController
                              .text) {
                        return "confirm_password_validation".tr(context);
                      }
                      return null;
                    },
                    hint: "***********",
                    fillColor: AppColors.cF5F5F5,
                    secure: true,
                  ),
                ],
              ),),


              Gap(20.h),
              CustomButtonInternet(
                height: 48,
                width: 361,
                horizontal: 0,
                title: "create_new_password".tr(context),
                onTap: () {
                  // if (context
                  //     .read<AuthCubit>()
                  //     .formKey
                  //     .currentState!
                  //     .validate()) {
                    Navigator.of(context).pushNamed(AppRoutes.authScreen);
                  // }
                },
              )
            ],
          ),
        ),
    );
  }
}
