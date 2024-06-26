import 'package:completed/core/common/widgets/custom_network_image.dart';
import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';

class CustomDropDownCodeButton extends StatelessWidget {
  const CustomDropDownCodeButton({
    super.key,
    this.width,
    required this.label,
    this.selectedValue,
    this.bgColor,
    this.borderColor,
  });

  final double? width;
  final String label;
  final Color? borderColor;
  final Color? bgColor;
  final TitleIdListModel? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 58.h,
        width: 140.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(ImageConstants.dropArrow,
              height: 8.h,
              width: 10.w,
            ),
            Text(selectedValue == null
                ? ""
                : selectedValue!.code.toString(),
              textDirection: TextDirection.ltr,
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w400,
                  size: 14, color: AppColors.c090909),
            ),
            CustomNetworkImage(
              imageUrl: selectedValue == null
                  ? ""
                  : selectedValue!.flag.toString(),
              height: 25.h,
              width: 25.w,
            ),
          ],
        )
    );
  }
}
