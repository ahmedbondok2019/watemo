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
                    'اسم الشركة / الهيئة',
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء ادخل اسم (الشركة / الهيئة)";
                      } else if (value.length <= 3) {
                        return "الاسم يجب ان يكون اكثر من 3 احرف";
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "اسم الشركة / الهيئة",
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
                              "بلد الاقامة",
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
                              label: "اختر بلد الاقامة",
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
                              "مدينة الاقامة",
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
                              label: "اختر مدينة الاقامة",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10.h),

                  /// address for company
                  Text(
                    'عنوان الشركه / الهيئة',
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء ادخل عنوان (الشركة / الهيئة)";
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "عنوان الشركة / الهيئة",
                    controller: authCubit.companyAddressController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// tax number for company
                  Text(
                    'الرقم الضريبي',
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء ادخل الرقم الضريبي ل (الشركة / الهيئة)";
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "الرقم الضريبي",
                    controller: authCubit.taxNumberController,
                    isNumber: true,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// phone number for company
                  Text(
                    'رقم الهاتف / الفاكس',
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
                            return "الرجاء ادخل رقم الهاتف / الفاكس";
                          }
                          else {
                            return null;
                          }
                        },
                        isRTL: false,
                        fillColor: AppColors.transparent,
                        hint: "رقم الهاتف / الفاكس",
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
                          label: "اختر كود الدولة",
                        ),
                      ),
                    ],
                  ),
                  Gap(15.h),

                  /// email
                  Text(
                    "البريد الالكتروني",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'please enter  email';
                      }
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    controller: authCubit.emailAddress,
                    fillColor: AppColors.transparent,
                    hint: 'البريد هنا',
                    height: 48.h,
                  ),
                  Gap(10.h),

                  /// expect count for company
                  Text(
                    'عدد المعتمرين المتوقع',
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء ادخل عدد المعتمرين المتوقع";
                      }
                      return null;
                    },
                    isNumber: true,
                    fillColor: AppColors.transparent,
                    hint: "عدد المعتمرين المتوقع",
                    controller: authCubit.expectCountController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// expect count for company
                  Text(
                    'رقم الحساب البنكي',
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Gap(5.h),
                  InputFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء ادخل رقم الحساب البنكي";
                      }
                      return null;
                    },
                    fillColor: AppColors.transparent,
                    hint: "رقم الحساب البنكي",
                    isNumber: true,
                    controller: authCubit.bankNumberController,
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// password && confirm password
                  Text(
                    "كلمة المرور",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 14),
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
                    height: 48.h,
                  ),
                  Gap(10.h),

                  /// confirm password
                  Text(
                    "تآكيد كلمة المرور",
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
                        return "رجاء ادخل كلمة المرور";
                      } else if (value.length < 8) {
                        return "كلمة المرور اكثر من 8 احرف";
                      } else if (authCubit.passwordController.text !=
                          authCubit.confirmPasswordController.text) {
                        return "كلمة المرور غير متطابقة";
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
                                "الرقم الضريبي",
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
                                  "السجل التجاري",
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
                              'أنا أوافق على ',
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.black),
                            ),
                            Text(
                              ' الشروط والأحكام ',
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.primary),
                            ),
                            Text(
                              ' و ',
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.black),
                            ),
                            Text(
                              ' سياسة الخصوصية ',
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
          title: "إنشاء حساب جديد",
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              if (context.read<AuthCubit>().country == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار البلد",
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().city == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار المدينة",
                    type: AlertType.warning);
              }
               if (context.read<AuthCubit>().taxNoImage == null) {
                CustomMessage.showMessage(context,
                    message: "يجب رفع صورة من الرقم الضريبي",
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().commercialNoImage == null) {
                CustomMessage.showMessage(context,
                    message: "يجب رفع صورة من السجل التجاري",
                    type: AlertType.warning);
              }
              else if (!context.read<AuthCubit>().termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "يجب الموافقة علي الشروط والاحكام",
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