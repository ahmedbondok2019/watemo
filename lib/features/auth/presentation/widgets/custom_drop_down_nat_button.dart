import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';

class CustomDropDownNatButton extends StatelessWidget {
  const CustomDropDownNatButton({
    super.key,
    this.width,
    required this.label,
    this.selectedValue,
    this.bgColor,
    this.borderColor,
    this.selectedValueDate,
    required this.isDate,
  });

  final double? width;
  final String label;
  final Color? borderColor;
  final Color? bgColor;
  final bool isDate;
  final TitleIdListModel? selectedValue;
  final String? selectedValueDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width ?? 180).w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor ?? AppColors.cC7C7C7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child:  Text(
            isDate
                ? selectedValueDate == null
                ? label
                : selectedValueDate!
                : selectedValue == null
                ? label
                : selectedValue!.title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textStyle(
                weight: FontWeight.w700,
                color: selectedValue != null || selectedValueDate != null
                    ? AppColors.c090909
                    : AppColors.c9A9A9A,
                size: 14
            ),
          ),),

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
