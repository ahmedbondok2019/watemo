import 'package:completed/core/common/widgets/custom_drop_down_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../src/app_export.dart';
import '../models/lang_model.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.list,
    required this.selectedItem,
    this.buttonWidth,
    this.dropDownWidth, this.dropDownHeight,
    this.rightPadding, this.height});
  final List<LangModel> list;
  final LangModel selectedItem;
  final double? buttonWidth;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final double? rightPadding;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<LangModel>(
        customButton: CustomDropDownButton(
          width:buttonWidth,
            selectedValue: selectedItem),
        isExpanded: true,
        barrierColor: AppColors.black.withOpacity(0.25),
        items: list.map((LangModel item) => DropdownMenuItem<LangModel>(
          value: item,
          child: Row(
            children: [
              Checkbox(
                  value: selectedItem.name == item.name,
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
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     item.name,
                     style: AppTextStyles.textStyle(
                       color: AppColors.c00243C,
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),

                   Image.asset(item.image!,width: 20.w,height: 16.h),
                 ],
               ),
             )
            ],
          )
        )).toList(),
        value: selectedItem,
        onChanged: (val){
          LocalizationBloc.get(context).changeLanguage(
            list.indexOf(val!)
          );
        },
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