import '../../src/app_export.dart';

class CustomSocialLoginBt extends StatelessWidget {
  const CustomSocialLoginBt({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  final void Function() onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                color: AppColors.cC7C7C7,
                width: 1
            ),
            color: AppColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(image,
                height: 24.h,
                width: 24.w,
              ),

              Text(title,
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w600,
                    size: 16, color: AppColors.c090909),
              ),

              SizedBox(
                width: 20.w,
              ),
            ],
          )
      ),
    );
  }
}