import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/common/widgets/custom_button_internet.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

class CustomActiveMobile extends StatefulWidget {
  const CustomActiveMobile({super.key});

  @override
  State<CustomActiveMobile> createState() => _CustomActiveMobileState();
}

class _CustomActiveMobileState extends State<CustomActiveMobile> {
  String email = "dromar@gmail.com";
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is TimerLoading) {
          return const CircularProgressIndicator();
        } else {
          return Container(
            height: 550.h,
            width: 342.w,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: AppColors.cF5ECD9,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
              child: Column(
                children: [
                  Text(
                    'activateEmail'.tr(context),
                    style: AppTextStyles.textStyle(
                      size: 19,
                      weight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(10.h),
                  Column(
                    children: [
                      Text(
                        "${'weSentCodeEmail'.tr(context)} ${'x' * (email.length - 10)}${email.substring(email.length - 10)}",
                        style: AppTextStyles.textStyle(
                            size: 17, color: AppColors.c7A869A),
                      ),
                      Gap(18.h),
                      SizedBox(
                        width: 270.w,
                        child: PinCodeTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          animationDuration: const Duration(milliseconds: 200),
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
                          'codeResent'.tr(context),
                          style: const TextStyle(
                              decorationColor: AppColors.primary,
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              color: AppColors.primary),
                        ),
                      ),
                      Gap(25.h),
                      CustomButtonInternet(
                        height: 52,
                        width: 312,
                        title: 'activate'.tr(context),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
