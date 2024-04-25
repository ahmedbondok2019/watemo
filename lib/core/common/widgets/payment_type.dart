import '../../../../core/src/app_export.dart';

class PaymentType extends StatelessWidget {
  final String title;
  final String image;
  final Color borderColor;
  final int value;
  final int groupValue;
  final Function() onTap;
  const PaymentType({super.key,
    required this.title,
    required this.image,
    required this.borderColor,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: borderColor,
              width: 1.5.h)
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListTile(
        title: Row(
          children: [
            Image.asset(image, height: 28.w,width: 79.w),
            Gap(10.w),
            Text(title,
              style: AppTextStyles.textStyle(
                color: AppColors.c090909,
                weight: FontWeight.w400,
                size: 14,
              ),
            ),
          ],
        ),
        leading: CustomRadio(
          value: value,
          groupValue: groupValue,
          onChanged: (v){
            onTap();
          },
        ),
        visualDensity: const VisualDensity(
            horizontal: -4.0, vertical: -2),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
        onTap: onTap,
      ),
    );
  }
}