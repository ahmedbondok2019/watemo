import 'package:completed/features/auth/presentation/widgets/social_auth.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_select_code.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
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
                  "phone".tr(context),
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w700,
                      color: AppColors.c090909,
                      size: 14),
                ),
                Gap(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormField(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "empty_phone_validation".tr(context);
                        } else {
                          return null;
                        }
                      },
                      isRTL: false,
                      suffixIcon: Image.asset(
                        ImageConstants.phoneIcon,
                        height: 12.h,
                        width: 18.w,
                      ),
                      isNumber: true,
                      hint: "0566569527",
                      width: 220.w,
                      controller: authCubit.phoneNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(null)
                      ],
                      textAlign: TextAlign.left,
                      fillColor: AppColors.cF5F5F5,
                    ),

                    CustomDropDownSelectCode(
                      list: authCubit.countriesList,
                      selectedItem: authCubit.countryCode,
                      onChanged: authCubit.changeCountryCode,
                      label: "select_country_code".tr(context),
                    ),
                  ],
                ),
                Gap(15.h),

                /// password
                Text(
                  "password".tr(context),
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w700,
                      color: AppColors.c090909,
                      size: 14),
                ),
                Gap(5.h),
                InputFormField(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "empty_password_validation".tr(context);
                    } else if (p0.length < 8) {
                      return "password_validation".tr(context);
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
                        margin:
                        EdgeInsetsDirectional.symmetric(horizontal: 5.w),
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
                      "remember".tr(context),
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w600,
                          size: 14,
                          color: AppColors.c090909),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.forgotPassword),
                      child: Text("forget_password?".tr(context),
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w600,
                            size: 14,
                            color: AppColors.c090909),
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
                      child: Text("or".tr(context),
                        style: AppTextStyles.textStyle(
                          size: 16,
                          weight: FontWeight.w500,
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

                const SocialAuth(),
              ],
            ),
          ),
        ),
      );
    });
  }

  BlocConsumer<AuthCubit, AuthState> loginButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) async {
      if (state is LoginFailure) {
        CustomMessage.showMessage(context,
            message:
                NetworkExceptions.getErrorMessage(state.networkExceptions) ==
                        "404"
                    ? "unauthorized".tr(context)
                    : NetworkExceptions.getErrorMessage(
                        state.networkExceptions,
                      ),
            type: AlertType.failed);
      }
      else if (state is LoginSuccess) {
        if (AppConstants.userType == AppConstants.user ||
            AppConstants.userType == AppConstants.company) {
          getIt<SharedPreferences>().setBool(AppConstants.isLoggedIn, true);
          getIt<SharedPreferences>()
              .setString(AppConstants.token, state.user!.token!);
          getIt<SharedPreferences>().setString(
              AppConstants.userData, json.encode(state.user?.toJson()));

          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.mainLayer, (route) => false);
        }
        else {
          if (state.user!.status == 0) {
            await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      actionsOverflowDirection: VerticalDirection.down,
                      actionsPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      titlePadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            ImageConstants.timeImage,
                            width: 260.w,
                            height: 260.w,
                          ),
                          Gap(10.h),
                          Text(
                            "review_your_account".tr(context),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textStyle(
                              color: AppColors.c090909,
                              weight: FontWeight.w400,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        CustomButtonInternet(
                          height: 48,
                          width: 112.5,
                          horizontal: 0,
                          vertical: 0,
                          title: "confirm".tr(context),
                          onTap: () => Navigator.pop(context),
                        ),
                        CustomButtonInternet(
                          height: 48,
                          width: 112.5,
                          horizontal: 0,
                          vertical: 0,
                          colorBg: AppColors.transparent,
                          borderColor: AppColors.c090909,
                          txtColor: AppColors.c090909,
                          title: "cancel".tr(context),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
            );
          }
          else if (state.user!.status == 1) {
            if (state.user!.showApprovalScreen!) {
            await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                  top: 15.h,
                  bottom: 10.h,
                ),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actionsOverflowAlignment: OverflowBarAlignment.center,
                actionsOverflowDirection: VerticalDirection.down,
                actionsPadding: EdgeInsets.symmetric(
                    horizontal: 15.w, vertical: 15.h),
                titlePadding: EdgeInsets.symmetric(
                    horizontal: 15.w, vertical: 15.h),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImageConstants.doneImage,
                      width: 212.w,
                      height: 202.h,
                    ),
                    Gap(20.h),
                    Text(
                      "accepted_your_account".tr(context),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyle(
                        color: AppColors.c090909,
                        weight: FontWeight.w400,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  CustomButtonInternet(
                    height: 48,
                    width: 361,
                    horizontal: 0,
                    vertical: 0,
                    title: "Start_using_now".tr(context),
                    onTap: () {
                      getIt<SharedPreferences>()
                          .setBool(AppConstants.isLoggedIn, true);
                      getIt<SharedPreferences>().setString(
                          AppConstants.token, state.user!.token!);
                      getIt<SharedPreferences>().setString(
                          AppConstants.userData,
                          json.encode(state.user!.toJson()));
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.mainLayer, (route) => false);
                    },
                  ),
                ],
              ),
            );
          }
            else{
              getIt<SharedPreferences>()
                  .setBool(AppConstants.isLoggedIn, true);
              getIt<SharedPreferences>().setString(
                  AppConstants.token, state.user!.token!);
              getIt<SharedPreferences>().setString(
                  AppConstants.userData,
                  json.encode(state.user!.toJson()));
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.mainLayer, (route) => false);
            }
          }
          else if (state.user!.status == 2) {
            await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 15.h,
                        bottom: 10.h,
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      actionsOverflowDirection: VerticalDirection.down,
                      actionsPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      titlePadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            ImageConstants.errorImage,
                            width: 212.w,
                            height: 202.h,
                          ),
                          Gap(20.h),
                          Text(
                            "reject_your_account".tr(context),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textStyle(
                              color: AppColors.c090909,
                              weight: FontWeight.w400,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        CustomButtonInternet(
                          height: 48,
                          width: 361,
                          horizontal: 0,
                          vertical: 0,
                          title: "contact_with_technical".tr(context),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,
                              AppRoutes.contactUs);}
                        ),
                      ],
                ),
            );
          }
        }
      }
    },
        builder: (context, state) {
      if (state is LoginLoading) {
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "logIn".tr(context),
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