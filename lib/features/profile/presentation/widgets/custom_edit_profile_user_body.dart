import 'package:completed/features/profile/presentation/widgets/upload_image.dart';
import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/confirm_order_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../auth/presentation/widgets/custom_drop_down_select_code.dart';
import '../../../checkout/cubit/checkout_cubit.dart';
import '../../cubit/profile_cubit.dart';

class CustomEditProfileUserBody extends StatelessWidget {
  const CustomEditProfileUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profile = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
      return Form(
        key: profile.formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UploadImage(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Gap(10.h),
                    InputFormField(
                      height: 48.h,
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
                      controller: profile.fullName,
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
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputFormField(
                          height: 75.h,
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
                          width: 210.w,
                          controller: profile.phoneNumber,
                          hint: "56656952",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(null)
                          ],
                          textAlign: TextAlign.left,
                          fillColor: AppColors.cF5F5F5,
                          hasLabel: true,
                        ),

                        SizedBox(
                          height: 48.h,
                          width: 132.w,
                          child: CustomDropDownSelectCode(
                            list: profile.countriesList,
                            selectedItem: profile.countryCode,
                            onChanged: profile.changeCountryCode,
                            label: "select_country_code".tr(context),
                          ),
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
                    Gap(10.h),
                    InputFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'empty_email_validation'.tr(context);
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'email_validation'.tr(context);
                        }
                        return null;
                      },
                      controller: profile.emailAddress,
                      fillColor: AppColors.cF5F5F5,
                      hint: 'hint_email'.tr(context),
                      suffixIcon: Image.asset(
                        ImageConstants.emailIcon,
                        height: 20.h,
                        width: 20.w,
                        color: AppColors.c7A808A,
                      ),
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
                      controller: profile.password,
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
                      controller: profile.confirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "empty_password_validation".tr(context);
                        } else if (value.length < 8) {
                          return "password_validation".tr(context);
                        } else if (profile.password.text !=
                            profile.confirmPassword.text) {
                          return "confirm_password_validation".tr(context);
                        }
                        return null;
                      },
                      fillColor: AppColors.cF5F5F5,
                      hint: "***********",
                      secure: true,
                    ),
                    Gap(10.h),

                    /// button edit profile
                    editButton(),

                    /// button remove account
                    CustomButtonInternet(
                      height: 48,
                      width: 361,
                      horizontal: 0,
                      size: 16,
                      weight: FontWeight.w700,
                      vertical: 0,
                      borderColor: AppColors.transparent,
                      colorBg: AppColors.transparent,
                      txtColor: AppColors.cE74C3C,
                      title: "remove_account".tr(context),
                      onTap: () {
                        showAnimatedDialog(context,
                            BlocBuilder<CheckoutCubit, CheckoutState>(
                                builder: (context, state) {
                                  return ConfirmOrderDialog(
                                    description: "confirm_remove_account".tr(context),
                                    isFailed: false,
                                    image: ImageConstants.said,
                                    onTapConfirm: context.read<ProfileCubit>().removeAccount,
                                  );
                                }),
                            dismissible: false, isFlip: true);
                      },
                    ),
                  ]),
            ]),
      );
    });
  }

  BlocConsumer<ProfileCubit, ProfileState> editButton() {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is ProfileFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      } else if (state is ProfileSuccess) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainLayer,
        );
      }
    }, builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "save_edit".tr(context),
          onTap: () {
            if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
              if (context.read<ProfileCubit>().myImage == null &&
                  context.read<ProfileCubit>().imageProfileNet == null) {
                CustomMessage.showMessage(context,
                    message: "set_profile_image".tr(context),
                    type: AlertType.warning);
              } else {
                context.read<ProfileCubit>().editProfile();
              }
            }
          },
        );
      }
    });
  }
}
