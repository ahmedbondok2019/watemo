import '../../../../core/src/app_export.dart';

class CustomDropDownSelectCode extends StatelessWidget {
  const CustomDropDownSelectCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
          height: 60.h,
          width: 132.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                color: AppColors.cC7C7C7,
                width: 1
            ),
            color: AppColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(ImageConstants.dropArrow,
                height: 8.h,
                width: 10.w,
              ),
              Text("+966",
                textDirection: TextDirection.ltr,
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w400,
                    size: 14, color: AppColors.c090909),
              ),
              Image.asset(ImageConstants.arabic,
                height: 25.h,
                width: 25.w,
              ),
            ],
          )
      ),
    );
  }
}