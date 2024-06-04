import '../../../../core/common/widgets/build_upload_photo_sheet.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_nat_res.dart';
import 'custom_drop_down_select_code.dart';

class CreateNewCompanyAccount extends StatelessWidget {
  const CreateNewCompanyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(
        context, listen: false);
    return BlocBuilder<AuthCubit,
        AuthState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.w, vertical: 14.h),
        child: Form(
          key: authCubit.formKey,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10.h),

                  /// name for company
                  Text(
                    'company_name'.tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_company_name_validation".tr(context);
                      } else if (value.length <= 3) {
                        return "name_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "company_name".tr(context),
                    controller: authCubit.companyNameController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// country && city
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
                              list: authCubit.countriesList,
                              selectedItem: authCubit.country,
                              onChanged: (val){
                                authCubit.getCities(countryId: val!.id.toString());
                                authCubit.changeCountry(val);
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

                  /// address for company
                  Text(
                    'company_address'.tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_company_address_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "company_address".tr(context),
                    controller: authCubit.companyAddressController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// tax number for company
                  Text(
                    'tax_number'.tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_tax_number_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: 'tax_number'.tr(context),
                    controller: authCubit.taxNumberController,
                    isNumber: true,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// phone number for company
                  Text(
                    'phone_fax'.tr(context),
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
                          }
                          else {
                            return null;
                          }
                        },
                        isRTL: false,
                        fillColor: AppColors.transparent,
                        hint: 'phone_fax'.tr(context),
                        controller: authCubit.faxNumberController,
                        suffixIcon: Image.asset(
                          ImageConstants.phonIcon,
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
                          list: authCubit.countriesList,
                          selectedItem: authCubit.countryCode,
                          onChanged: authCubit.changeCountryCode,
                          label: "select_country_code".tr(context),
                        ),
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
                    controller: authCubit.emailAddress,
                    fillColor: AppColors.transparent,
                    hint: "hint_email".tr(context),
                    height: 48.h,
                  ),
                  Gap(10.h),

                  /// expect count for company
                  Text(
                    "expected_number_pilgrims".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_expected_number_pilgrims_validation".tr(context);
                      }
                      return null;
                    },
                    isNumber: true,
                    fillColor: AppColors.transparent,
                    hint: "expected_number_pilgrims".tr(context),
                    controller: authCubit.expectCountController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// bank account number for company
                  Text(
                    "bank_account_number".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "empty_bank_account_number_validation".tr(context);
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "bank_account_number".tr(context),
                    isNumber: true,
                    controller: authCubit.bankNumberController,
                    height: 48.h,
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
                    controller: authCubit.passwordController,
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
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// images for tax number && commercial
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "tax_number".tr(context),
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w700,
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
                                        borderRadius: BorderRadius.circular(8.r)
                                    ),
                                    child: authCubit.taxNoImage != null
                                        ? Image.file(
                                      authCubit.taxNoImage!,
                                      fit: BoxFit.fill,
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
                                        onTap: (){
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  BuildUploadPhotoSheet(
                                                    onCameraTap: () {
                                                      Navigator.of(context).pop();
                                                      authCubit.setCameraTaxNoImages();
                                                    },
                                                    onGalleryTap: () {
                                                      Navigator.of(context).pop();
                                                      authCubit.setGalleryTaxNoImages();
                                                    },
                                                  ));
                                        },
                                        child: Container(
                                          width: 24.w,
                                          height: 24.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.circular(5.r)
                                          ),
                                          child: const Center(child: Icon(
                                            Icons.add,size: 18,
                                            color: AppColors.white,)),
                                        ),
                                      )
                                  ),
                                ],
                              ),

                            ])),

                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "commercial_register".tr(context),
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w700,
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
                                          borderRadius: BorderRadius.circular(8.r)
                                      ),
                                      child: authCubit.commercialNoImage != null
                                          ? Image.file(
                                        authCubit.commercialNoImage!,
                                        fit: BoxFit.fill,
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
                                          onTap: (){
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    BuildUploadPhotoSheet(
                                                      onCameraTap: () {
                                                        Navigator.of(context).pop();
                                                        authCubit.setCameraCommercialNoImages();
                                                      },
                                                      onGalleryTap: () {
                                                        Navigator.of(context).pop();
                                                        authCubit.setGalleryCommercialNoImages();
                                                      },
                                                    ));
                                          },
                                          child: Container(
                                            width: 24.w,
                                            height: 24.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColors.primary, 
                                                borderRadius: BorderRadius.circular(5.r)
                                            ),
                                            child: const Center(child: Icon(
                                                Icons.add,size: 18,
                                            color: AppColors.white,)),
                                          ),
                                        )
                                    ),
                                  ],
                                ),

                              ])),
                    ],
                  ),

                  /// term && condition
                  Gap(15.h),
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
                            onChanged: authCubit.updateTermsAndConditionCheckBox,
                            checkColor: AppColors.primary,
                            activeColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            )),
                      ),
                      Gap(5.w),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "approve".tr(context),
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

                  /// register Button
                  registerButtonWidget()
                ]),
          ),
        ),
      );
    });
  }

  BlocConsumer<AuthCubit, AuthState> registerButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is RegisterCompanyFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is RegisterCompanySuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is RegisterCompanyLoading) {
        return const Center(child: CustomLoading());
      }
      else {
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
               if (context.read<AuthCubit>().taxNoImage == null) {
                CustomMessage.showMessage(context,
                    message: "must_upload_tax_image".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().commercialNoImage == null) {
                CustomMessage.showMessage(context,
                    message: "must_upload_commercial_image".tr(context),
                    type: AlertType.warning);
              }
              else if (!context.read<AuthCubit>().termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "must_approve_on_term".tr(context),
                    type: AlertType.warning);
              }
              else {
                context.read<AuthCubit>().registerCompany();
              }
            }
          },
        );
      }
    });
  }
}