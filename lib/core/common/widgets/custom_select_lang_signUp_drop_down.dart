import 'package:dropdown_button2/dropdown_button2.dart';
import '../../src/app_export.dart';
import '../models/title_id_model/title_id_list_model.dart';
import 'custom_select_lang_sigUp_drop_down_button.dart';

class CustomSelectLangSignUpDropDown extends StatelessWidget {
  const CustomSelectLangSignUpDropDown({super.key, required this.list,
    required this.selectedItem,
    required this.selectedLang,
    required this.selected,
    this.buttonWidth,required this.label,required this.onChanged,
    this.dropDownWidth, this.dropDownHeight,
    this.rightPadding, this.height});
  final List<TitleIdListModel> list;
  final Function(TitleIdListModel? value) onChanged;
  final List<TitleIdListModel> selectedItem;
  final TitleIdListModel? selected;
  final String? selectedLang;
  final double? buttonWidth;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final double? rightPadding;
  final double? height;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<TitleIdListModel>(
        customButton: CustomSelectLangSignUpDropDownButton(
          width: buttonWidth,
            selectedValue: selectedLang,
            label: label),
        isExpanded: true,
        barrierColor: AppColors.black.withOpacity(0.25),
        items: list.map((TitleIdListModel item) => DropdownMenuItem<TitleIdListModel>(
          value: item,
          child: Row(
            children: [
              Checkbox(
                  value: selectedItem.isNotEmpty &&
                      selectedItem.contains(item),
                  checkColor: AppColors.white,
                  side: const BorderSide(
                    color: AppColors.cC7C7C7,
                    width: 1.5,
                  ),
                  visualDensity: const VisualDensity(horizontal: -3),
                  onChanged: (val){}
              ),

             SizedBox(
               width: 95.w,
               child: Text(
                 item.title.tr(context),
                 style: AppTextStyles.textStyle(
                   color: AppColors.c00243C,
                 ),
                 overflow: TextOverflow.ellipsis,
               ),
             )
            ],
          )
        )).toList(),
        value: selected,
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
        menuItemStyleData: MenuItemStyleData(
          height: (height??30).h,
          padding: EdgeInsets.zero,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: (dropDownHeight??174).h,
          width: (dropDownWidth??158).w,
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