import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import '../src/app_export.dart';

Future<Country?> showCountryPickerDialog(
  BuildContext context, {
  Widget? title,
  double cornerRadius = 8,
  bool focusSearchBox = false,
}) {
  return showDialog<Country?>(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(cornerRadius),
            )),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.only(right: 15.w),
                          height: 28.h,
                          width: 28.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: AppColors.primary, shape: BoxShape.circle),
                          child: Icon(
                            Icons.close,
                            color: AppColors.white,
                            size: 18.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Center(
                      child: title ??
                          Text(
                            'Choose region',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textStyle(
                              size: 16,
                              weight: FontWeight.w700,
                            ),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: CountryPickerWidget(
                    onSelected: (country) => Navigator.of(context).pop(country),
                  ),
                ),
              ],
            ),
          ));
}

Future<void> showDeleteAccountDialog(
    BuildContext context, Function()? onTap) async {
  return showModalBottomSheet(
      context: context,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      )),
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(top: 7.h, left: 10.w, bottom: 31.h, right: 10.w),
          width: double.infinity,
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 27.w,
                    height: 27.h,
                    decoration: const BoxDecoration(
                      color: AppColors.cF3F3F3,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      ImageConstants.close,
                      width: 12.19.w,
                      height: 12.19.h,
                    ),
                  ),
                ),
              ),
              Image.asset(
                ImageConstants.deleteAccount,
                width: 55.w,
                height: 60.h,
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                "deleteAccount".tr(context),
                style: AppTextStyles.textStyle(
                  size: 19,
                  color: AppColors.cFF3535,
                  weight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'deleteAccountMessage'.tr(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle(
                  size: 16,
                  color: AppColors.c7A808A,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButtonInternet(
                onTap: onTap,
                height: 51,
                width: 311,
                title: 'deleteAccount'.tr(context),
                size: 18,
                // weight: FontWeight.w700,
              ),
            ],
          ),
        );
      });
}
