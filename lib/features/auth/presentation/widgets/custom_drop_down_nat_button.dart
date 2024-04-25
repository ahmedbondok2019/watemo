import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';

class CustomDropDownNatButton extends StatelessWidget {
  const CustomDropDownNatButton({super.key,
    this.width, required this.label, this.selectedValue});
  final double? width;
  final String label;
  final TitleIdListModel? selectedValue;
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
          Text(selectedValue == null
              ? label
              : selectedValue!.title!,
            style: AppTextStyles.textStyle(
                weight: FontWeight.w700,
                color: AppColors.c090909, size: 14),
          ),

          SvgPicture.asset(ImageConstants.dropArrow,
            height: 8.h,
            width: 10.w,
          ),
        ],
      ),
    );
  }
}