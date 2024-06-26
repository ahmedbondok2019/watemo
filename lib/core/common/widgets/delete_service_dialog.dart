import 'package:completed/core/src/app_export.dart';

class DeleteServiceDialog extends StatelessWidget {
  final String title;
  final Function() onTapConfirm;

  const DeleteServiceDialog(
      {super.key, required this.onTapConfirm, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Gap(10.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageConstants.deleteIcon,
                  width: 24.w,
                  height: 24.w,
                  color: AppColors.red,
                ),
                Gap(10.w),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle(
                    color: AppColors.c090909,
                    weight: FontWeight.w600,
                    size: 14,
                  ),
                ),
              ],
            )),
        Gap(10.h),
        Text(
          "delete_service".tr(context),
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle(
            color: AppColors.c090909,
            weight: FontWeight.w600,
            size: 14,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtonInternet(
              height: 48,
              width: 132.5,
              horizontal: 0,
              title: "confirm".tr(context),
              onTap: onTapConfirm,
            ),
            CustomButtonInternet(
              height: 48,
              width: 132.5,
              horizontal: 0,
              vertical: 0,
              colorBg: AppColors.transparent,
              borderColor: AppColors.c090909,
              txtColor: AppColors.c090909,
              title: "cancel".tr(context),
              onTap: () => Navigator.pop(context),
            ),
          ],
        )
      ]),
    );
  }
}
