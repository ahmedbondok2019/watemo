import 'package:completed/core/src/app_export.dart';

class ConfirmOrderDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final double? widthImage;
  final double? heightImage;
  final String description;
  final String image;
  final Function() onTapConfirm;
  const ConfirmOrderDialog({super.key,
    this.isFailed = false,
    this.rotateAngle = 0,
    this.widthImage,
    this.heightImage,
    required this.image,
    required this.onTapConfirm, required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Gap(20.h),
            Image.asset(
                image,
                width: (widthImage ?? 79).w,
                height: (heightImage ?? 79).h
            ),

            Gap(15.h),

            Text(description,
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
                  onTap: ()=>Navigator.pop(context),
                ),
              ],
            )
          ]),
    );
  }
}