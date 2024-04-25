import '../../../../core/src/app_export.dart';

class SelectLangScreen extends StatelessWidget {
  final bool isEdit;
  const SelectLangScreen({super.key,this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            isEdit
                ? const CustomAppBar(
              title: "تعديل لغة التطبيق",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            )
                : const SizedBox(),

            isEdit
                ? Gap(10.h)
                : Gap(110.h),

            Image.asset(
              ImageConstants.logoSplash,
              fit: BoxFit.contain,
              width: 132.w,
              height: 72.h,
            ),

            Gap(30.h),
            Center(
              child: Text(
                "اختر لغتك المفضلة",
                style: AppTextStyles.textStyle(
                    size: 24,
                  weight: FontWeight.w700,
                  color: AppColors.c090909
                ),
              ),
            ),
            Gap(10.h),
            Center(
              child: Text(
                "من فضلك اختر لغتك المفضله حتي يمكنك المتابعه للتطبيق",
                style: AppTextStyles.textStyle(
                    size: 14,
                    weight: FontWeight.w400,
                    color: AppColors.c090909
                ),
              ),
            ),
            Gap(20.h),
            const SelectLang(),

            const Spacer(),
            CustomButtonInternet(
              title: isEdit
                  ? "حفظ التعديل"
                  : "التالي",
              width: MediaQuery.of(context).size.width,
              onTap: ()=> isEdit
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(
                  context,
                  AppRoutes.selectUserType),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
