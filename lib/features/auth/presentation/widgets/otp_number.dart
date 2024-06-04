import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/src/app_export.dart';

class OtpNumber extends StatefulWidget {
  final String phone;
  const OtpNumber({super.key,required this.phone});
  @override
  State<OtpNumber> createState() => _OtpNumberState();
}
class _OtpNumberState extends State<OtpNumber> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            children: [
              Gap(10.h),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "enter_send_otp".tr(context),
                      style: AppTextStyles.textStyle(
                        size: 16,
                        weight: FontWeight.w500,
                        color: AppColors.c090909,
                        // color: AppColors.c9A9A9A,
                      ),
                    ),
                    Gap(10.h),
                    Text("+966${widget.phone}",
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.textStyle(
                        size: 16,
                        weight: FontWeight.w600,
                        color: AppColors.c090909,
                      ),
                    ),
                  ]),
              Gap(25.h),
              Column(
                children: [
                  SizedBox(
                    width: 270.w,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        animationDuration:
                        const Duration(milliseconds: 200),
                        appContext: context,
                        length: 4,
                        autoFocus: true,
                        textStyle: AppTextStyles.textStyle(size: 20),
                        autoDismissKeyboard: true,
                        cursorColor: AppColors.primary,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            selectedFillColor: AppColors.primary,
                            selectedColor: AppColors.cE3E3E3,
                            inactiveFillColor: Colors.transparent,
                            inactiveColor: AppColors.cE3E3E3,
                            borderRadius: BorderRadius.circular(12.r),
                            errorBorderColor: AppColors.cE3E3E3,
                            disabledColor: AppColors.cE3E3E3,
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 50.w,
                            fieldWidth: 60.w,
                            activeColor: AppColors.cE3E3E3,
                            activeFillColor: AppColors.primary),
                      ),
                    ),
                  ),
                  Gap(15.h),
                  Text(
                    '00:${context.read<AuthCubit>().secondsRemaining}',
                    style: AppTextStyles.textStyle(
                        size: 15, color: AppColors.c7A869A),
                  ),
                  Gap(10.h),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "resend_otp".tr(context),
                      style: AppTextStyles.textStyle(
                          decorationColor: AppColors.primary,
                          decoration: TextDecoration.underline,
                          size: 15, color: AppColors.primary),
                    ),
                  ),
                  Gap(25.h),
                  CustomButtonInternet(
                    height: 48,
                    width: 361,
                    title: "check_otp".tr(context),
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.resetPassword),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
