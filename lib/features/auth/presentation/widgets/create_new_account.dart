import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_dropDown_select_code.dart';
import 'custom_drop_down_nat_res.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context, listen: false);
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is SwitchRememberLoading) {
        return const CircularProgressIndicator();
      } else {
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
                      'الاسم ثلاثي',
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w700,
                          color: AppColors.c090909,
                          size: 14),
                    ),
                    Gap(5.h),
                    InputFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء ادخل الاسم";
                        } else if (value.length <= 3) {
                          return "الاسم يجب ان يكون اكثر من 3 احرف";
                        }
                        return null;
                      },
                      fillColor: AppColors.cF5F5F5,
                      hint: "الاسم هنا",
                      controller: authCubit.fullName,
                      suffixIcon: Image.asset(
                        ImageConstants.profileIcon,
                        color: AppColors.c7A808A,
                      ),
                    ),
                    Gap(10.h),

                    /// phone
                    Text(
                      "رقم الهاتف",
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
                              return "رجاء ادخل رقم الموبايل";
                            } else if (p0.length < 10) {
                              return "رجاء اخل رقم الموبايل كامل";
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
                          controller: authCubit.phoneNumberController,
                          hint: "0566569527",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          textAlign: TextAlign.left,
                          fillColor: AppColors.cF5F5F5,
                          hasLabel: true,
                        ),
                        const CustomDropDownSelectCode(),
                      ],
                    ),
                    Gap(10.h),

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
                      fillColor: AppColors.cF5F5F5,
                      hint: 'البريد هنا',
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
                          width: 172.w,
                          height: 74.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الجنسية",
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w700,
                                    color: AppColors.c090909,
                                    size: 14),
                              ),
                              CustomDropDownNat(
                                list: authCubit.nationalityList,
                                selectedItem: authCubit.nationality,
                                onChanged: authCubit.changeNationality,
                                label: "اختر الجنسية",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 172.w,
                          height: 74.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "محل الاقامة",
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w700,
                                    color: AppColors.c090909,
                                    size: 14),
                              ),
                              CustomDropDownNat(
                                list: authCubit.residenceList,
                                selectedItem: authCubit.residence,
                                onChanged: authCubit.changeResidence,
                                label: "اختر محل الاقامة",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Gap(10.h),

                    /// password
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
                      controller: context.read<AuthCubit>().passwordController,
                      secure: true,
                    ),
                    Gap(10.h),
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
                    registerButtonWidget()
                  ]),
            ),
          ),
        );
      }
    });
  }

  BlocConsumer<AuthCubit, AuthState> registerButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is RegisterFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is RegisterSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is RegisterInitial) {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "إنشاء حساب جديد",
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              if (context.read<AuthCubit>().nationality == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار الجنسية",
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().residence == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار محل الاقامة",
                    type: AlertType.warning);
              }
              else if (!context.read<AuthCubit>().termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "يجب الموافقة علي الشروط والاحكام",
                    type: AlertType.warning);
              }
              else {
                context.read<AuthCubit>().register();
              }
            }
          },
        );
      }
      else if (state is RegisterLoading) {
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
              if (context.read<AuthCubit>().nationality == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار الجنسية",
                    type: AlertType.warning);
              }
              else if (context.read<AuthCubit>().residence == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار محل الاقامة",
                    type: AlertType.warning);
              }
              else if (!context.read<AuthCubit>().termsAndConditionCheckBoxValue) {
                CustomMessage.showMessage(context,
                    message: "يجب الموافقة علي الشروط والاحكام",
                    type: AlertType.warning);
              }
              else {
                context.read<AuthCubit>().register();
              }
            }
          },
        );
      }
    });
  }
}