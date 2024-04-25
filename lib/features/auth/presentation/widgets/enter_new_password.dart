import '../../../../core/common/widgets/InputFormField.dart';
import '../../../../core/common/widgets/custom_button_internet.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/auth_cubit.dart';

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
                "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
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
                    "كلمة المرور",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(15.h),
                  InputFormField(
                    controller: context.read<AuthCubit>().passwordController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "رجاء ادخل كلمة المرور";
                      } else if (p0.length < 8) {
                        return "كلمة المرور اكثر من 8 احرف";
                      }
                      return null;
                    },
                    secure: true,
                    fillColor: AppColors.cF5F5F5,
                    hint: "***********",
                  ),
                  Gap(25.h),

                  Text(
                    "تأكيد كلمة المرور",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(15.h),
                  InputFormField(
                    controller: context.read<AuthCubit>().confirmPasswordController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "رجاء ادخل كلمة المرور";
                      } else if (p0.length < 8) {
                        return "كلمة المرور اكثر من 8 احرف";
                      } else if (context
                          .read<AuthCubit>()
                          .passwordController
                          .text !=
                          context
                              .read<AuthCubit>()
                              .confirmPasswordController
                              .text) {
                        return "كلمة المرور غير متطابقة";
                      }
                      return null;
                    },
                    hint: "***********",
                    fillColor: AppColors.cF5F5F5,
                    secure: true,
                    // context.read<AuthCubit>().isObscureText
                    //     ? Image.asset(
                    //         ImageConstants.secureIcon,
                    //         height: 0.h,
                    //         width: 0.w,
                    //       )
                    //     : Image.asset(
                    //         ImageConstants.hidePassword,
                    //         height: 5.h,
                    //         width: 5.w,
                    //       ),
                    // hasLabel: true,
                  ),
                ],
              ),),


              Gap(20.h),
              CustomButtonInternet(
                height: 48,
                width: 361,
                horizontal: 0,
                title: 'إنشاء كلمة المرور جديدة',
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
