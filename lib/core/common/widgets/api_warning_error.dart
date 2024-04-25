import 'package:flutter_svg/flutter_svg.dart';
import '../../src/app_export.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.text, this.success=false, this.textColor, this.iconColor, this.onTap});
  final String text;
  final bool? success;
  final Color? textColor;
  final Color? iconColor;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            color: success==false?AppColors.snackBarSuccessBackgroundColor:AppColors.snackBarBackgroundColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: success==false?AppColors.primary:AppColors.c43B166,width: 2.w,)
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              success==true?'assets/icons/alert-correct.svg':'assets/icons/alert-orange.svg',
              height: 40.h,
              width: 40.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            SizedBox(
              width: 210.w,
              child: Text(
                text,
                style: AppTextStyles.textStyle(
                  color: AppColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: const Icon(
                CupertinoIcons.clear,
                color: Colors.grey,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
