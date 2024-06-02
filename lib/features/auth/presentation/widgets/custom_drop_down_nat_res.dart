import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';
import 'custom_drop_down_nat_button.dart';

class CustomDropDownNat extends StatelessWidget {
  const CustomDropDownNat({
    super.key,
    this.list,
    this.listDate,
    this.selectedItem,
    this.onChanged,
    this.onChangedDate,
    required this.label,
    this.dropDownWidth,
    this.dropDownHeight,
    this.rightPadding,
    this.height,
    this.width,
    this.borderColor,
    this.bgColor,
    this.isDate = false,
    this.selectedItemDate,
  });

  final List<TitleIdListModel>? list;
  final List<String>? listDate;
  final TitleIdListModel? selectedItem;
  final String? selectedItemDate;
  final Function(TitleIdListModel? value)? onChanged;
  final Function(String? value)? onChangedDate;
  final String label;
  final bool isDate;
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
      child: isDate
          ? DropdownButton2<String>(
              customButton: CustomDropDownNatButton(
                width: width,
                label: label,
                selectedValueDate: selectedItemDate,
                isDate: isDate,
              ),
              isExpanded: true,
              barrierColor: AppColors.black.withOpacity(0.25),
              items: listDate
                  ?.map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: AppTextStyles.textStyle(
                            color: AppColors.c00243C,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedItemDate,
              onChanged: onChangedDate!,
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
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.primary,
                ),
                iconSize: 14,
                iconEnabledColor: AppColors.primary,
                iconDisabledColor: Colors.grey,
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
                  thumbColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                  trackColor:
                      MaterialStateProperty.all<Color>(AppColors.cD7D7D7),
                  thickness: MaterialStateProperty.all(2.r),
                ),
                scrollPadding: EdgeInsets.all(8.r),
                offset: Offset(0.w, 0),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: (height ?? 30).h,
                padding: EdgeInsets.only(right: (rightPadding ?? 20).w),
              ),
            )
          : DropdownButton2<TitleIdListModel>(
              customButton: CustomDropDownNatButton(
                width: width,
                label: label,
                selectedValue: selectedItem,
                isDate: isDate,
                borderColor: borderColor,
                bgColor: bgColor,
              ),
              isExpanded: true,
              barrierColor: AppColors.black.withOpacity(0.25),
              items: list
                  ?.map((TitleIdListModel item) =>
                      DropdownMenuItem<TitleIdListModel>(
                        value: item,
                        child: Text(
                          item.title,
                          style: AppTextStyles.textStyle(
                            color: AppColors.c00243C,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              // value: selectedItem,
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
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.primary,
                ),
                iconSize: 14,
                iconEnabledColor: AppColors.primary,
                iconDisabledColor: Colors.grey,
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
                  thumbColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                  trackColor:
                      MaterialStateProperty.all<Color>(AppColors.cD7D7D7),
                  thickness: MaterialStateProperty.all(2.r),
                ),
                scrollPadding: EdgeInsets.all(8.r),
                offset: Offset(0.w, 0),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: (height ?? 30).h,
                padding: EdgeInsets.only(right: (rightPadding ?? 20).w),
              ),
            ),
    );
  }
}
