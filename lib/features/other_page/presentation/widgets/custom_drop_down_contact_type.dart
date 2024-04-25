import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/support/contact_type_model.dart';
import 'custom_dropDown_contact_type_bt.dart';

class CustomDropDownContactType extends StatelessWidget {
  const CustomDropDownContactType({
    super.key,
    required this.list,
    required this.selectedItem,
    required this.onChanged,
    required this.label,
    this.buttonWidth,
    this.dropDownWidth,
    this.dropDownHeight,
    this.rightPadding,
    this.height});

  final List<ContactTypeModel> list;
  final ContactTypeModel selectedItem;
  final Function(ContactTypeModel? value) onChanged;
  final String label;
  final double? buttonWidth;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final double? rightPadding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<ContactTypeModel>(
        customButton: CustomDropDownContactTypeBt(
          width:buttonWidth,label: label,
            selectedValue: selectedItem),
        isExpanded: true,
        barrierColor: AppColors.black.withOpacity(0.25),
        items: list.map((ContactTypeModel item) => DropdownMenuItem<
            ContactTypeModel>(
          value: item,
          child: Text(
            item.nameAr,
            style: AppTextStyles.textStyle(
              color: AppColors.c00243C,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )).toList(),
        value: selectedItem,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 54.h,
          width: 158.w,
          padding:  EdgeInsets.only(left: 14.w, right: 14.w),
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
          maxHeight: (dropDownHeight??174).h,
          width: (dropDownWidth??158).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          scrollbarTheme: ScrollbarThemeData(
            // thickness: MaterialStateProperty.all<double>(6),
            radius: Radius.zero,
            thumbVisibility: MaterialStateProperty.all(true),
            trackVisibility: MaterialStateProperty.all(true),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.primary),
            trackColor: MaterialStateProperty.all<Color>(AppColors.cD7D7D7),
            thickness: MaterialStateProperty.all(2.r),
          ),
          scrollPadding: EdgeInsets.all(8.r),
          offset: Offset(0.w, 0),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: (height??30).h,
          padding: EdgeInsets.only(right: (rightPadding??20).w),
        ),
      ),
    );
  }
}