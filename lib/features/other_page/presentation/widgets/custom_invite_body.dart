import '../../../../core/src/app_export.dart';

class CustomInviteBody extends StatelessWidget {
  const CustomInviteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Gap(25.h),
        Image.asset(ImageConstants.inviteFriend,
          width: 362.w,height: 250.h,
        ),
        Gap(25.h),
        Container(
          width: 363.w,height: 48.h,
          margin: EdgeInsets.symmetric(vertical: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.cC7C7C7
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(ImageConstants.copy,
                width: 24.w,height: 24.h,
              ),

              Text("ان شاء الله هيكون هنا رابط التطبيق",
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w400,
                    color: AppColors.c090909,
                    size: 14),
              ),
            ],
          )
        ),

        Gap(25.h),

        CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "share_app".tr(context),
          onTap: () async {
            await Share.shareUri(
              Uri.parse(EndPoints.baseUrl),
            );
          },
        )
      ],
    );
  }
}