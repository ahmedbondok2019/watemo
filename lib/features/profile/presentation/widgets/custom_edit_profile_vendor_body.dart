import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/build_upload_photo_sheet.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/common/widgets/custom_select_lang_signUp_drop_down.dart';
import '../../../../core/common/widgets/confirm_order_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../auth/presentation/widgets/custom_drop_down_nat_res.dart';
import '../../../auth/presentation/widgets/custom_drop_down_select_code.dart';
import '../../../checkout/cubit/checkout_cubit.dart';
import '../../cubit/profile_cubit.dart';

class CustomEditProfileVendorBody extends StatelessWidget {
  const CustomEditProfileVendorBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profile = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return Form(
        key: profile.formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),

              /// image
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 135.w,
                      height: 135.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          shape: BoxShape.circle),
                      child: profile.myImage != null ||
                              profile.imageProfileNet != null
                          ? profile.myImage != null
                              ? Image.file(
                                  profile.myImage!,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  width: 135.w,
                                  height: 135.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomNetworkImage(
                                    imageUrl: profile.user!.image!,
                                    fit: BoxFit.fill,
                                    width: 135.w,
                                    height: 135.h,
                                  ))
                          : Image.asset(
                              ImageConstants.noImageAuth,
                              fit: BoxFit.fill,
                            ),
                    ),
                    Positioned(
                        bottom: 12.h,
                        right: 15.w,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => BuildUploadPhotoSheet(
                                      onCameraTap: () {
                                        Navigator.of(context).pop();
                                        profile.setCameraImages();
                                      },
                                      onGalleryTap: () {
                                        Navigator.of(context).pop();
                                        profile.setGalleryImages();
                                      },
                                    ));
                          },
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.white, shape: BoxShape.circle),
                            child: Center(
                              child: SvgPicture.asset(
                                ImageConstants.camera,
                                width: 17.w,
                                height: 15.h,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              /// name for company
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
                fillColor: AppColors.transparent,
                hint: 'name'.tr(context),
                textColor: AppColors.c090909,
                controller: profile.fullName,
                height: 48.h,
              ),
              Gap(15.h),

              /// birthdate for vendor
              Text(
                'brith_date'.tr(context),
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w700,
                    color: AppColors.c090909,
                    size: 14),
              ),
              Gap(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110.w,
                    height: 48.h,
                    child: CustomDropDownNat(
                      listDate: profile.days,
                      selectedItemDate: profile.day.toString(),
                      isDate: true,
                      onChangedDate: profile.changeDay,
                      label: "day".tr(context),
                      isTrans: false,
                    ),
                  ),

                  SizedBox(
                    width: 110.w,
                    height: 48.h,
                    child: CustomDropDownNat(
                      listDate: profile.months,
                      selectedItemDate: profile.month.toString(),
                      isDate: true,
                      onChangedDate: profile.changeMonth,
                      label: "month".tr(context),
                      isTrans: false,
                    ),
                  ),

                  SizedBox(
                    width: 110.w,
                    height: 48.h,
                    child: CustomDropDownNat(
                      listDate: profile.years,
                      selectedItemDate: profile.year.toString(),
                      isDate: true,
                      onChangedDate: profile.changeYear,
                      label: "year".tr(context),
                      isTrans: false,
                    ),
                  ),
                ],
              ),
              Gap(10.h),

              /// country && city
              SizedBox(
                height: 76.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "original_nationality".tr(context),
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w700,
                          color: AppColors.c090909,
                          size: 14),
                    ),
                    Gap(5.h),
                    CustomDropDownNat(
                      list: profile.countriesList,
                      width: 400.w,
                      selectedItem: profile.nationality,
                      onChanged: profile.changeNationality,
                      label: "select_original_nationality".tr(context),
                      isTrans: false,
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 80.h,
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
                        Gap(5.h),
                        CustomDropDownNat(
                          list: profile.countriesList,
                          selectedItem: profile.country,
                          onChanged: (val) {
                            profile.getCities(countryId: val!.id.toString());
                            profile.changeCountry(val);
                          },
                          label: "select_country".tr(context),
                          isTrans: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                    height: 80.h,
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
                        Gap(5.h),
                        CustomDropDownNat(
                          list: profile.citiesList,
                          selectedItem: profile.city,
                          onChanged: profile.changeCity,
                          label: "select_city".tr(context),
                          isTrans: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(10.h),

              /// gender
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "gender".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  CustomDropDownNat(
                    list: profile.genders,
                    selectedItem: profile.gender,
                    onChanged: profile.changeGender,
                    label: "select_gender",
                    width: 393.w,
                    isTrans: true,
                  ),
                ],
              ),
              Gap(15.h),

              /// language
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lang_vendor".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  CustomSelectLangSignUpDropDown(
                    list: profile.languages,
                    selectedItem: profile.selectLang,
                    selected: profile.selectL,
                    selectedLang: profile.selectedLang,
                    onChanged: profile.changeLang,
                    label: "select_lang_vendor".tr(context),
                    buttonWidth: 393.w,
                  ),
                ],
              ),
              Gap(15.h),

              /// services
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "services_provided".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),

                  CustomSelectLangSignUpDropDown(
                    list: profile.servicesType,
                    selectedItem: profile.selectServices,
                    selected: profile.selectS,
                    selectedLang: profile.selectedService,
                    onChanged: profile.changeServices,
                    label: "select_services_provided".tr(context),
                    buttonWidth: 393.w,
                  ),
                ],
              ),
              Gap(15.h),

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
                    return "email_validation".tr(context);
                  }
                  return null;
                },
                controller: profile.emailAddress,
                fillColor: AppColors.transparent,
                textColor: AppColors.c090909,
                hint: 'hint_email'.tr(context),
                height: 48.h,
              ),
              Gap(15.h),

              /// phone number for company
              Text(
                'phone'.tr(context),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_phone_vendor_validation".tr(context);
                      } else {
                        return null;
                      }
                    },
                    isRTL: false,
                    fillColor: AppColors.transparent,
                    hint: "phone".tr(context),
                    textColor: AppColors.c090909,
                    controller: profile.phoneNumber,
                    suffixIcon: Image.asset(
                      ImageConstants.phoneIcon,
                      height: 12.h,
                      width: 18.w,
                    ),
                    isNumber: true,
                    width: 230.w,
                    height: 48.h,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(null)
                    ],
                    textAlign: TextAlign.left,
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
              Gap(15.h),

              /// password && confirm password
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
                textColor: AppColors.c090909,
                secure: true,
                height: 48.h,
              ),
              Gap(10.h),

              /// confirm password
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
                textColor: AppColors.c090909,
                secure: true,
                height: 48.h,
              ),
              Gap(15.h),

              /// images for tax number && commercial
              Text(
                "photo_personal_id".tr(context),
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w700,
                    color: AppColors.c090909,
                    size: 14),
              ),
              Gap(8.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "front_side".tr(context),
                            style: AppTextStyles.textStyle(
                                weight: FontWeight.w500,
                                color: AppColors.c090909,
                                size: 14),
                          ),
                          Gap(5.h),
                          Stack(
                            children: [
                              Container(
                                width: 175.w,
                                height: 118.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: profile.identityFace != null ||
                                    profile.imageIdentityFace != null
                                    ? profile.identityFace != null
                                        ? Image.file(
                                            profile.identityFace!,
                                            fit: BoxFit.fill,
                                          )
                                        : CustomNetworkImage(
                                  imageUrl: profile.imageIdentityFace!,
                                  fit: BoxFit.fill,
                                  width: 135.w,
                                  height: 135.h,
                                )
                                    : Image.asset(
                                        ImageConstants.noImageAuth,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              Positioned(
                                top: 12.h,
                                right: 15.w,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            BuildUploadPhotoSheet(
                                              onCameraTap: () {
                                                Navigator.of(context).pop();
                                                profile
                                                    .setCameraIdentityFaceImages();
                                              },
                                              onGalleryTap: () {
                                                Navigator.of(context).pop();
                                                profile
                                                    .setGalleryIdentityFaceImages();
                                              },
                                            ));
                                  },
                                  child: Container(
                                    width: 24.w,
                                    height: 24.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: AppColors.white,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "back_side".tr(context),
                            style: AppTextStyles.textStyle(
                                weight: FontWeight.w500,
                                color: AppColors.c090909,
                                size: 14),
                          ),
                          Gap(5.h),
                          Stack(
                            children: [
                              Container(
                                width: 175.w,
                                height: 118.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: profile.identityFace != null ||
                                profile.imageIdentityFace != null
                                    ? profile.identityFace != null
                                        ? Image.file(
                                                profile.identityBack!,
                                                fit: BoxFit.fill,
                                              )
                                        : CustomNetworkImage(
                                  imageUrl: profile.imageIdentityFace!,
                                  fit: BoxFit.fill,
                                  width: 135.w,
                                  height: 135.h,
                                )
                                    : Image.asset(
                                        ImageConstants.noImageAuth,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              Positioned(
                                  top: 12.h,
                                  right: 15.w,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              BuildUploadPhotoSheet(
                                                onCameraTap: () {
                                                  Navigator.of(context).pop();
                                                  profile
                                                      .setCameraIdentityBackImages();
                                                },
                                                onGalleryTap: () {
                                                  Navigator.of(context).pop();
                                                  profile
                                                      .setGalleryIdentityBackImages();
                                                },
                                              ));
                                    },
                                    child: Container(
                                      width: 24.w,
                                      height: 24.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColors.white,
                                      )),
                                    ),
                                  )),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),

              Gap(12.h),

              /// edit Button
              editProfileButton(),

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
                  }), dismissible: false, isFlip: true);
                },
              ),
            ]),
      );
    });
  }

  BlocConsumer<ProfileCubit, ProfileState> editProfileButton() {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is ProfileFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is ProfileSuccess) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainLayer,
        );
      }
    }, builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "save_edit".tr(context),
          onTap: () {
            if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
              if (context.read<ProfileCubit>().myImage == null
              && context.read<ProfileCubit>().imageProfileNet == null) {
                CustomMessage.showMessage(context,
                    message: "set_profile_image".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().day == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_day".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().month == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_month".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().year == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_year".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().nationality == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_nationality".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().country == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_country".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().city == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_city".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().gender == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_gender".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().selectLang.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "must_select_lang".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().selectServices.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "must_select_service".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().identityFace == null
                  && context.read<ProfileCubit>().imageIdentityFace == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_front_side_image".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().identityBack == null
                  && context.read<ProfileCubit>().imageIdentityBack == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_back_side_image".tr(context),
                    type: AlertType.warning);
              }
              else {
                context.read<ProfileCubit>().editVendorProfile();
              }
            }
          },
        );
      }
    });
  }
}