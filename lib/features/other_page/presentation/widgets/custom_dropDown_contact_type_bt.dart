import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';

class CustomDropDownContactTypeBt extends StatelessWidget {
  const CustomDropDownContactTypeBt({super.key,
    this.width,
    required this.label,
    required this.selectedValue});
  final double? width;
  final String label;
  final TitleIdListModel selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,height: 48.h,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: AppColors.cC7C7C7
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedValue.title.tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w700,
                color: AppColors.c090909, size: 14),
          ),

          SvgPicture.asset(ImageConstants.dropArrow,
              width: 15.w,height: 7.h
          ),
        ],
      ),
    );
  }
}