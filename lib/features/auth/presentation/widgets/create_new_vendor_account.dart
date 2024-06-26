import '../../../../core/common/widgets/build_upload_photo_sheet.dart';
import '../../../../core/common/widgets/custom_select_lang_signUp_drop_down.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_nat_res.dart';
import 'custom_drop_down_select_code.dart';

class CreateNewVendorAccount extends StatelessWidget {
  const CreateNewVendorAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context, listen: false);
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
                  /// image
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 135.w,
                          height: 135.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: authCubit.imageVendor != null
                              ? Image.file(
                            authCubit.imageVendor!,
                            fit: BoxFit.fill,
                          )
                              : Image.asset(
                            ImageConstants.noImageAuth,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Positioned(
                            bottom: 12.h,
                            right: 15.w,
                            child: InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        BuildUploadPhotoSheet(
                                          onCameraTap: () {
                                            Navigator.of(context).pop();
                                            authCubit.setCameraVendorImages();
                                          },
                                          onGalleryTap: () {
                                            Navigator.of(context).pop();
                                            authCubit.setGalleryVendorImages();
                                          },
                                        ));
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.h,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle
                                ),
                                child: Center(child: SvgPicture.asset(
                                  ImageConstants.camera,
                                  width: 17.w,
                                  height: 15.h,
                                ),),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                  /// name for company
                  Text(
                    "name".tr(context),
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
                    hint: "name".tr(context),
                    controller: authCubit.vendorNameController,
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
                      CustomDropDownNat(
                          listDate: authCubit.days,
                          selectedItemDate: authCubit.day,
                          isDate: true,
                          width: 130.w,
                          onChangedDate: authCubit.changeDay,
                          label: "day".tr(context),
                          isTrans: false,
                      ),

                      CustomDropDownNat(
                          listDate: authCubit.months,
                          selectedItemDate: authCubit.month,
                          isDate: true,
                          width: 130.w,
                          onChangedDate: authCubit.changeMonth,
                          label: "month".tr(context),
                          isTrans: false,
                      ),

                      CustomDropDownNat(
                          listDate: authCubit.years,
                          selectedItemDate: authCubit.year,
                          isDate: true,
                          width: 130.w,
                          onChangedDate: authCubit.changeYear,
                          label: "year".tr(context),
                        isTrans: false,
                      ),
                    ],
                  ),
                  Gap(10.h),

                  /// country && city
                  Gap(10.h),
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
                          list: authCubit.countriesList,
                          width: 400.w,
                          selectedItem: authCubit.nationality,
                          onChanged: authCubit.changeNationality,
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
                        list: authCubit.genders,
                        selectedItem: authCubit.gender,
                        onChanged: authCubit.changeGender,
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
                        list: authCubit.languages,
                        selectedItem: authCubit.selectLang,
                        selected: authCubit.selectL,
                        selectedLang: authCubit.selectedLang,
                        onChanged: authCubit.changeLang,
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
                        list: authCubit.servicesType,
                        selectedItem: authCubit.selectServices,
                        selected: authCubit.selectS,
                        selectedLang: authCubit.selectedService,
                        onChanged: authCubit.changeServices,
                        label: "select_services_provided",
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
                    controller: authCubit.emailAddress,
                    fillColor: AppColors.transparent,
                    hint: 'hint_email'.tr(context),
                    height: 48.h,
                  ),
                  Gap(15.h),

                  /// i bank
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
                      if (value == null || value.trim().isEmpty) {
                        return 'empty_bank_account_number_validation'.tr(context);
                      }
                      return null;
                    },
                    controller: authCubit.bankNumberController,
                    fillColor: AppColors.transparent,
                    isNumber: true,
                    hint: 'bank_account_number'.tr(context),
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
                          }
                          else {
                            return null;
                          }
                        },
                        isRTL: false,
                        fillColor: AppColors.transparent,
                        hint: "phone".tr(context),
                        controller: authCubit.phoneNumberController,
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
                          list: authCubit.countriesList,
                          selectedItem: authCubit.countryCode,
                          onChanged: authCubit.changeCountryCode,
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
                                          borderRadius: BorderRadius.circular(8.r)
                                      ),
                                      child: authCubit.identityFace != null
                                          ? Image.file(
                                        authCubit.identityFace!,
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
                                                        authCubit.setCameraIdentityFaceImages();
                                                      },
                                                      onGalleryTap: () {
                                                        Navigator.of(context).pop();
                                                        authCubit.setGalleryIdentityFaceImages();
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
                                          borderRadius: BorderRadius.circular(8.r)
                                      ),
                                      child: authCubit.identityBack != null
                                          ? Image.file(
                                        authCubit.identityBack!,
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
                                                        authCubit.setCameraIdentityBackImages();
                                                      },
                                                      onGalleryTap: () {
                                                        Navigator.of(context).pop();
                                                        authCubit.setGalleryIdentityBackImages();
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
                              ]),
                      ),
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
                           InkWell(
                             onTap: ()=>
                               Navigator.pushNamed(context, AppRoutes.termConditions),
                             child: Text(
                               "term_condition".tr(context),
                               style: AppTextStyles.textStyle(
                                   size: 14, color: AppColors.primary),
                             ),
                           ),
                            Text(
                              "and".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.black),
                            ),
                            InkWell(
                                onTap: ()=>
                                    Navigator.pushNamed(context, AppRoutes.privacy),
                                child: Text(
                              'privacy_policy'.tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, color: AppColors.primary),
                            )),
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
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) async {
      if (state is RegisterVendorFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is RegisterVendorSuccess) {
        if(state.user!.status == 0){
          await showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
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
                        horizontal: 15.w,vertical: 15.h),
                    titlePadding: EdgeInsets.symmetric(
                        horizontal: 15.w,vertical: 15.h),
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
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.authScreen, (route) => false);
                        },
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
                        onTap: ()=>Navigator.pop(context),
                      ),
                    ],
                  ));
        }
        else if(state.user!.status == 1){
          await showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
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
                        horizontal: 15.w,vertical: 15.h),
                    titlePadding: EdgeInsets.symmetric(
                        horizontal: 15.w,vertical: 15.h),
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
                        onTap: (){
                          getIt<SharedPreferences>()
                              .setBool(AppConstants.isLoggedIn, true);
                          getIt<SharedPreferences>()
                              .setString(AppConstants.token, state.user!.token!);
                          getIt<SharedPreferences>().setString(
                              AppConstants.userData, json.encode(state.user!.toJson()));
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutes.mainLayer, (route) => false);
                        },
                      ),
                    ],
                  ),
          );
        }
        else if(state.user!.status == 2){
          await showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
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
                        horizontal: 15.w,vertical: 15.h),
                    titlePadding: EdgeInsets.symmetric(
                        horizontal: 15.w,vertical: 15.h),
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
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, AppRoutes.contactUs);
                        },
                      ),
                    ],
                  ),
          );
        }
      }
    }, builder: (context, state) {
      if (state is RegisterVendorLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "register".tr(context),
          onTap: () async {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              if (context.read<AuthCubit>().nationality == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_nationality".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().country == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_country".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().city == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_city".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().gender == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_gender".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().selectServices.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "must_select_service".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().selectLang.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "must_select_lang".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().imageVendor == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_profile_image".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().identityFace == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_front_side_image".tr(context),
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().identityBack == null) {
                CustomMessage.showMessage(context,
                    message: "must_select_back_side_image".tr(context),
                    type: AlertType.warning);
              }
              else if (!context.read<AuthCubit>().termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "must_approve_on_term".tr(context),
                    type: AlertType.warning);
              }
              else {
                context.read<AuthCubit>().registerVendor();
              }
            }
          },
        );
      }
    });
  }
}