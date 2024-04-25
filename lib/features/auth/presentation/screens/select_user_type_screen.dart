import '../../../../core/src/app_export.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
              child: Container(
                color: AppColors.cBEA235,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.logoSplash,
                      fit: BoxFit.contain,
                      width: 132.w,
                      height: 73.h,
                    ),
                    Gap(30.h),
                    Center(
                      child: Text(
                        "تطبيق واتموا لخدمات الحج والعمرة للغير",
                        style: AppTextStyles.textStyle(
                            size: 20,
                            weight: FontWeight.w700,
                            color: AppColors.c090909),
                      ),
                    ),
                    Gap(50.h),
                  ],
                ),
              )
          ),

          Expanded(
              flex: 7,
              child: BackgroundComponent(
                opacity: 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(40.h),
                    Center(
                      child: Text(
                        "برجاء اختيار طريقة الدخول",
                        style: AppTextStyles.textStyle(
                            size: 20,
                            weight: FontWeight.w700,
                            color: AppColors.c090909),
                      ),
                    ),
                    Gap(30.h),
                    CustomButtonInternet(
                      title: "هل أنت طالب خدمة؟ سجل الآن",
                      vertical: 12,
                      width: MediaQuery.of(context).size.width,
                      onTap: ()=> Navigator.pushNamed(context,
                          AppRoutes.onBoarding),
                    ),
                    CustomButtonInternet(
                      title: "هل ترغب في الربح معنا؟ سجل الآن",
                      colorBg: Colors.transparent,
                      txtColor: AppColors.c090909,
                      borderColor: AppColors.cBEA235,
                      width: MediaQuery.of(context).size.width,
                      vertical: 12,
                      onTap: ()=> Navigator.pushNamed(context,
                          AppRoutes.onBoarding),
                    ),
                    CustomButtonInternet(
                      title: "الدخول كشركة",
                      vertical: 12,
                      colorBg: Colors.transparent,
                      txtColor: AppColors.c090909,
                      width: MediaQuery.of(context).size.width,
                      onTap: () => Navigator.pushNamed(context,
                          AppRoutes.onBoarding),
                    ),
                    Gap(20.h),
                    const Spacer(),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}