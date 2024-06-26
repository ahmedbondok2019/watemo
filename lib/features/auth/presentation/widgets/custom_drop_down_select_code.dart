import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import 'custom_drop_down_code_button.dart';

class CustomDropDownSelectCode extends StatelessWidget {
  const CustomDropDownSelectCode({
    super.key,
    this.list,
    this.selectedItem,
    this.onChanged,
    required this.label,
    this.dropDownWidth,
    this.dropDownHeight,
    this.rightPadding,
    this.height,
    this.width,
    this.borderColor,
    this.bgColor,
  });

  final List<TitleIdListModel>? list;
  final TitleIdListModel? selectedItem;
  final Function(TitleIdListModel? value)? onChanged;
  final String label;
  final Color? borderColor;
  final Color? bgColor;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final double? rightPadding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<TitleIdListModel>(
        customButton: CustomDropDownCodeButton(
          width: width,
          label: label,
          selectedValue: selectedItem,
          borderColor: borderColor,
          bgColor: bgColor,
        ),
        isExpanded: true,
        barrierColor: AppColors.black.withOpacity(0.25),
        items: list
            ?.map((TitleIdListModel item) => DropdownMenuItem<TitleIdListModel>(
                value: item,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNetworkImage(
                      imageUrl: item.flag.toString(),
                      height: 25.h,
                      width: 25.w,
                    ),
                    Gap(10.w),
                    Text(
                      item.code.toString(),
                      style: AppTextStyles.textStyle(
                        color: AppColors.c00243C,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 54.h,
          width: 158.w,
          padding: EdgeInsets.only(left: 14.w, right: 14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.amber,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: (height ?? 30).h,
          padding: EdgeInsets.zero,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: (dropDownHeight ?? 174).h,
          width: (dropDownWidth ?? 158).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.zero,
            thumbVisibility: MaterialStateProperty.all(true),
            trackVisibility: MaterialStateProperty.all(true),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.primary),
            trackColor: MaterialStateProperty.all<Color>(AppColors.cC7C7C7),
            thickness: MaterialStateProperty.all(2.r),
          ),
          scrollPadding: EdgeInsets.all(8.r),
          offset: Offset(0.w, 0),
        ),
      ),
    );
  }
}
