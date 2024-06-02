import 'package:completed/features/auth/presentation/widgets/create_new_company_account.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/create_new_vendor_account.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            Column(
              children: [
                Gap(72.h),
                Image.asset(
                  ImageConstants.logoSplash,
                  fit: BoxFit.contain,
                  width: 132.w,
                  height: 72.h,
                ),
                Gap(20.h),
                Center(
                  child: Text(
                    "مرحباً بكم",
                    style: AppTextStyles.textStyle(
                        size: 28,
                        weight: FontWeight.w700,
                        color: AppColors.primary),
                  ),
                ),
                Gap(10.h),
                Center(
                  child: Text(
                    "في تطبيق عمرة للغير لكل من هو غير قادر علي ادائها",
                    style: AppTextStyles.textStyle(
                        size: 15,
                        weight: FontWeight.w400,
                        color: AppColors.c090909),
                  ),
                ),
                Gap(20.h),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  return Container(
                    height: 56.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.12),
                          blurRadius: 24,
                          offset: const Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButtonInternet(
                          title: "تسجيل الدخول",
                          horizontal: 0,
                          size: 16,
                          vertical: 0,
                          height: 40,
                          width: 172,
                          colorBg: authCubit.isLogin ? null : AppColors.white,
                          txtColor:
                              authCubit.isLogin
                                  ? null
                                  : AppColors.c090909,
                          onTap: authCubit.changeStatusAuth,
                        ),
                        CustomButtonInternet(
                          title: "انشاء حساب جديد",
                          horizontal: 0,
                          vertical: 0,
                          height: 40,
                          width: 172,
                          colorBg: authCubit.isLogin
                              ? AppColors.white
                              : null,
                          txtColor:
                              authCubit.isLogin
                                  ? AppColors.c090909
                                  : null,
                          onTap: authCubit.changeStatusAuth,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),

            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              return Expanded(
                  child: authCubit.isLogin
                      ? const CustomLoginContainer()
                      : AppConstants.userType ==  AppConstants.user
                        ? const CreateNewUserAccount()
                        : AppConstants.userType ==  AppConstants.vendor
                            ? const CreateNewVendorAccount()
                            : const CreateNewCompanyAccount()
              );
            }),
          ],
        ),
      ),
    );
  }
}