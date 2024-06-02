import 'package:completed/features/profile/presentation/widgets/upload_image.dart';
import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/build_upload_photo_sheet.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/common/widgets/confirm_order_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../auth/presentation/widgets/custom_drop_down_nat_res.dart';
import '../../../auth/presentation/widgets/custom_drop_down_select_code.dart';
import '../../../checkout/cubit/checkout_cubit.dart';
import '../../cubit/profile_cubit.dart';

class CustomEditProfileCompanyBody extends StatelessWidget {
  const CustomEditProfileCompanyBody({super.key});

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
                      controller: profile.companyNameController,
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
                                list: profile.countriesList,
                                selectedItem: profile.country,
                                onChanged: (val){
                                  profile.getCities(countryId: val!.id.toString());
                                  profile.changeCountry(val);
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
                                list: profile.citiesList,
                                selectedItem: profile.city,
                                onChanged: profile.changeCity,
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
                      controller: profile.companyAddressController,
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
                      controller: profile.taxNumberController,
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
                          controller: profile.faxNumberController,
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
                            list: profile.countriesList,
                            selectedItem: profile.countryCode,
                            onChanged: profile.changeCountryCode,
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
                      controller: profile.emailAddress,
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
                      controller: profile.expectCountController,
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
                      controller: profile.bankNumberController,
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
                      controller: profile.password,
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
                      controller: profile.confirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "رجاء ادخل كلمة المرور";
                        } else if (value.length < 8) {
                          return "كلمة المرور اكثر من 8 احرف";
                        } else if (profile.password.text !=
                            profile.confirmPassword.text) {
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
                                        child: profile.taxNoImage != null ||
                                            profile.taxNoImageNet != null
                                            ? profile.taxNoImage != null
                                            ? Image.file(
                                          profile.taxNoImage!,
                                          fit: BoxFit.fill,
                                        )
                                            : CustomNetworkImage(
                                          imageUrl: profile.taxNoImageNet!,
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
                                            onTap: (){
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      BuildUploadPhotoSheet(
                                                        onCameraTap: () {
                                                          Navigator.of(context).pop();
                                                          profile.setCameraTaxNoImages();
                                                        },
                                                        onGalleryTap: () {
                                                          Navigator.of(context).pop();
                                                          profile.setGalleryTaxNoImages();
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
                                        child: profile.commercialNoImage != null ||
                                            profile.commercialNoImageNet != null
                                            ? profile.identityFace != null
                                            ? Image.file(
                                          profile.commercialNoImage!,
                                          fit: BoxFit.fill,
                                        )
                                            : CustomNetworkImage(
                                          imageUrl: profile.commercialNoImageNet!,
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
                                            onTap: (){
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      BuildUploadPhotoSheet(
                                                        onCameraTap: () {
                                                          Navigator.of(context).pop();
                                                          profile.setCameraCommercialNoImages();
                                                        },
                                                        onGalleryTap: () {
                                                          Navigator.of(context).pop();
                                                          profile.setGalleryCommercialNoImages();
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

                    Gap(15.h),
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
                      title: "حذف الحساب",
                      onTap: () {
                        showAnimatedDialog(context,
                            BlocBuilder<CheckoutCubit, CheckoutState>(
                                builder: (context, state) {
                                  return ConfirmOrderDialog(
                                    description: "هل انت متاكد من انك تريد حذف الحساب",
                                    isFailed: false,
                                    image: ImageConstants.said,
                                    onTapConfirm: () {
                                      context.read<ProfileCubit>().removeAccount();
                                    },
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
      }
      else if (state is ProfileSuccess) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainLayer,
        );
      }
    },
        builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "حفظ التعديل",
          onTap: () {
            if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
              if (context.read<ProfileCubit>().myImage == null
                  && context.read<ProfileCubit>().imageProfileNet == null) {
                CustomMessage.showMessage(context,
                    message: "يجب وضع صورة للملف الشخصي",
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().country == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار البلد",
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().city == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار المدينة",
                    type: AlertType.warning);
              }
              if (context.read<ProfileCubit>().taxNoImage == null
                  && context.read<ProfileCubit>().taxNoImageNet == null) {
                CustomMessage.showMessage(context,
                    message: "يجب رفع صورة من الرقم الضريبي",
                    type: AlertType.warning);
              }
              else if (context.read<ProfileCubit>().commercialNoImage == null
                  && context.read<ProfileCubit>().commercialNoImageNet == null) {
                CustomMessage.showMessage(context,
                    message: "يجب رفع صورة من السجل التجاري",
                    type: AlertType.warning);
              }
              else {
                context.read<ProfileCubit>().editCompanyProfile();
              }
            }
          },
        );
      }
    });
  }
}