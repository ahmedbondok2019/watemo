import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_dropDown_select_code.dart';

class CustomForgotPassword extends StatelessWidget {
  const CustomForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 14.r),
      child: Form(
          key: context.read<AuthCubit>().formKey,
          child: Column(children: [
            Gap(10.h),
            Text(
              'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: AppTextStyles.textStyle(
                size: 17,
                weight: FontWeight.w500,
                color: AppColors.c090909,
                // color: AppColors.c7A869A,
              ),
            ),
            Gap(10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  width: 210.w,
                  hint: "0507187555",
                  controller: context.read<AuthCubit>().phoneNumberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  textAlign: TextAlign.left,
                  fillColor: AppColors.cF5F5F5,
                  hasLabel: true,
                ),
                const CustomDropDownSelectCode(),
              ],
            ),
            Gap(20.h),

            forgetButtonWidget(),
          ])),
    );
  }

  BlocConsumer<AuthCubit, AuthState> forgetButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgetPasswordFailure) {
            CustomMessage.showMessage(context,
                message: NetworkExceptions.getErrorMessage(
                  state.networkExceptions,
                ) == "401"
                    ? "unauthorized".tr(context)
                    : NetworkExceptions.getErrorMessage(
                  state.networkExceptions,
                ),
                type: AlertType.failed);
          }
          else if (state is ForgetPasswordSuccess) {
            Navigator.pushNamed(
                context, AppRoutes.otpScreen,
              arguments: context.read<AuthCubit>().phoneNumberController.text
            );
          }
        }, builder: (context, state) {
      if (state is ForgetPasswordInitial) {
        return CustomButtonInternet(
            height: 52,
            width: 361,
            horizontal: 0,
            title: 'نسيت كلمة المرور',
            onTap: () {
              if (context.read<AuthCubit>().formKey.currentState!.validate()) {
                  context.read<AuthCubit>().forgetPassword();
              }
            });
      } else if (state is ForgetPasswordLoading) {
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
            height: 52,
            width: 361,
            horizontal: 0,
            title: 'نسيت كلمة المرور',
            onTap: () {
              if (context.read<AuthCubit>().formKey.currentState!.validate()) {
                context.read<AuthCubit>().forgetPassword();
              }
            });
      }
    });
  }
}