import '../../src/app_export.dart';
import '../models/lang_model.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key,
      this.width, required this.selectedValue});
  final double? width;
  final LangModel selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.transparent,
      ),
      child: Center(child:
      BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localeState) {
          return Row(
            children: [
              Image.asset(
                LocalizationBloc.get(context)
                    .langList[0]
                    .image!,
                width: 20.w,
                height: 16.w,
              ),
              Gap(10.w),
              Text(
                selectedValue.name,
                style: AppTextStyles.textStyle(
                    color: AppColors.c090909, size: 14),
              ),
              Gap(10.w),
              const Icon(Icons.keyboard_arrow_down_sharp,
                  size: 20),
            ],
          );
        },
      )),
    );
  }
}