import '../../../../core/common/widgets/custom_social_login_bt.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_dropDown_select_code.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is SwitchRememberLoading) {
        return const CircularProgressIndicator();
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
          child: Form(
            key: authCubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// phone
                  Gap(10.h),
                  Text(
                    "رقم الهاتف",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputFormField(
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "رجاء ادخل رقم الموبايل";
                          } else if (p0.length < 10) {
                            return "رجاء اخل رقم الموبايل كامل";
                          } else {
                            return null;
                          }
                        },
                        isRTL: false,
                        suffixIcon: Image.asset(
                          ImageConstants.phonIcon,
                          height: 12.h,
                          width: 18.w,
                        ),
                        isNumber: true,
                        hint: "0566569527",
                        width: 210.w,
                        controller: authCubit.phoneNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        textAlign: TextAlign.left,
                        fillColor: AppColors.cF5F5F5,
                      ),
                      const CustomDropDownSelectCode(),
                    ],
                  ),
                  Gap(15.h),
                  /// password
                  Text(
                    "كلمة المرور",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909, size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "رجاء ادخل كلمة المرور";
                      } else if (p0.length < 8) {
                        return "كلمة المرور اكثر من 8 احرف";
                      }
                      return null;
                    },
                    hint: "***********",
                    fillColor: AppColors.cF5F5F5,
                    controller: authCubit.passwordController,
                    secure: true,
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: authCubit.switchRememberFunction,
                        child: Container(
                          margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 5.w),
                          height: 20.w,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: authCubit.remember
                                ? Image.asset(
                              ImageConstants.done,
                              color: AppColors.primary,
                              height: 12.h,
                              width: 12.w,
                            )
                                : null,
                          ),
                        ),
                      ),
                      Text(
                        'تذكرني',
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w600,
                            size: 14, color: AppColors.c090909
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(AppRoutes.forgotPassword),
                        child: Text(
                          'هل نسيت كلمة المرور؟',
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w600,
                              size: 14, color: AppColors.c090909),
                        ),
                      ),
                    ],
                  ),
                  Gap(18.h),
                  loginButtonWidget(),

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.cC6C6C6,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'أو',
                          style: AppTextStyles.textStyle(
                            size: 16,weight: FontWeight.w500,
                            color: AppColors.c090909,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColors.cC6C6C6,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Gap(12.h),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSocialLoginBt(
                        onTap: () {},
                        title: "تسجيل بواسطة جوجل",
                        image: ImageConstants.google,
                      ),
                      CustomSocialLoginBt(
                        onTap: () {},
                        title: "تسجيل بواسطة فيسبوك",
                        image: ImageConstants.facebook,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  BlocConsumer<AuthCubit, AuthState> loginButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is LoginFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ) == "404"
                ? "unauthorized".tr(context)
                : NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      } else if (state is LoginSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.mainLayer,
                (route) => false
        );
      }
    }, builder: (context, state) {
      if (state is LoginInitial) {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "تسجيل الدخول",
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              context.read<AuthCubit>().login();
            }
          },
        );
      } else if (state is LoginLoading) {
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "تسجيل الدخول",
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              context.read<AuthCubit>().login();
            }
          },
        );
      }
    });
  }
}