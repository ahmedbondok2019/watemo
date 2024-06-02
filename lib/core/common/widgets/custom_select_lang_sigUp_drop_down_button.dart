import '../../../../core/src/app_export.dart';

class CustomSelectLangSignUpDropDownButton extends StatelessWidget {
  const CustomSelectLangSignUpDropDownButton({
    super.key,
    this.width,
    required this.label,
    required this.selectedValue,
  });

  final double? width;
  final String label;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width ?? 172).w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.cC7C7C7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedValue == null || selectedValue!.isEmpty
                ? label
                : selectedValue!,
            style: AppTextStyles.textStyle(
                weight: FontWeight.w700,
                color: selectedValue == null || selectedValue!.isEmpty
                    ? AppColors.c9A9A9A
                    : AppColors.c090909,
                size: 14
            ),
          ),
          SvgPicture.asset(
            ImageConstants.dropArrow,
            height: 8.h,
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
