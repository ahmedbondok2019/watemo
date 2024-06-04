import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_nat_res.dart';
import 'custom_drop_down_select_code.dart';

class CreateNewUserAccount extends StatelessWidget {
  const CreateNewUserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context, listen: false);
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 14.r),
        child: Form(
          key: authCubit.formKey,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10.h),
                  Text(
                    'name'.tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_name_validation".tr(context);
                      } else if (value.length <= 3) {
                        return "name_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.cF5F5F5,
                    hint: "hint_name".tr(context),
                    controller: authCubit.fullName,
                    suffixIcon: Image.asset(
                      ImageConstants.profileIcon,
                      color: AppColors.c7A808A,
                    ),
                  ),
                  Gap(10.h),

                  /// phone
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
                          ImageConstants.phonIcon,
                          height: 12.h,
                          width: 18.w,
                        ),
                        isNumber: true,
                        width: 220.w,
                        controller: authCubit.phoneNumberController,
                        hint: "0566569527",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(null)
                        ],
                        textAlign: TextAlign.left,
                        fillColor: AppColors.cF5F5F5,
                        hasLabel: true,
                      ),

                      CustomDropDownSelectCode(
                        list: authCubit.countriesList,
                        selectedItem: authCubit.countryCode,
                        onChanged: authCubit.changeCountryCode,
                        label: "select_country_code".tr(context),
                      ),
                    ],
                  ),
                  Gap(10.h),

                  /// email
                  Text(
                    "email".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "empty_email_validation".tr(context);
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'email_validation'.tr(context);
                      }
                      return null;
                    },
                    controller: authCubit.emailAddress,
                    fillColor: AppColors.cF5F5F5,
                    hint: 'hint_email'.tr(context),
                    suffixIcon: Image.asset(
                      ImageConstants.emailIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.c7A808A,
                    ),
                  ),

                  /// national
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 185.w,
                        height: 74.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "country".tr(context),
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w700,
                                  color: AppColors.c090909,
                                  size: 14),
                            ),
                            CustomDropDownNat(
                              list: authCubit.countriesList,
                              selectedItem: authCubit.country,
                              onChanged: (val) {
                                authCubit.getCities(
                                    countryId: val!.id.toString());
                                authCubit.changeCountry(val);
                              },
                              label: "select_country".tr(context),
                              isTrans: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 185.w,
                        height: 74.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "city".tr(context),
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w700,
                                  color: AppColors.c090909,
                                  size: 14),
                            ),
                            CustomDropDownNat(
                              list: authCubit.citiesList,
                              selectedItem: authCubit.city,
                              onChanged: authCubit.changeCity,
                              label: "select_city".tr(context),
                              isTrans: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Gap(10.h),

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
                    controller: context.read<AuthCubit>().passwordController,
                    secure: true,
                  ),
                  Gap(10.h),
                  Text(
                    "confirm_password".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    controller: authCubit.confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_password_validation".tr(context);
                      } else if (value.length < 8) {
                        return "password_validation".tr(context);
                      } else if (authCubit.passwordController.text !=
                          authCubit.confirmPasswordController.text) {
                        return "confirm_password_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.cF5F5F5,
                    hint: "***********",
                    secure: true,
                  ),
                  Gap(10.h),

                  Row(
                    children: [
                      Container(
                        height: 20.w,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            )),
                        child: Checkbox(
                            side: const BorderSide(color: Colors.transparent),
                            value: authCubit.termsAndConditionCheckBoxValue,
                            onChanged:
                                authCubit.updateTermsAndConditionCheckBox,
                            checkColor: AppColors.primary,
                            activeColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                        ),
                      ),
                      Gap(5.w),
                      Expanded(
                        child: Row(
                          children: [
                            Text("approve".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.black),
                            ),
                            Text("term_condition".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.primary),
                            ),
                            Text("and".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.black),
                            ),
                            Text("privacy_policy".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(12.h),
                  registerButtonWidget()
                ]),
          ),
        ),
      );
    });
  }

  BlocConsumer<AuthCubit, AuthState> registerButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is RegisterUserFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      } else if (state is RegisterUserSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is RegisterUserLoading) {
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "register".tr(context),
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              if (context.read<AuthCubit>().country == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_country".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().city == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_city".tr(context),
                    type: AlertType.warning);
              }
              else if (!context
                  .read<AuthCubit>()
                  .termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "must_approve_on_term".tr(context),
                    type: AlertType.warning);
              } else {
                context.read<AuthCubit>().registerUser();
              }
            }
          },
        );
      }
    });
  }
}