import 'dart:io';
import 'package:completed/core/src/app_export.dart';

class ExitPopUp extends StatelessWidget {
  final Widget child;
  const ExitPopUp({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopUp() async {
      return await showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actionsOverflowAlignment: OverflowBarAlignment.center,
              actionsOverflowDirection: VerticalDirection.down,
              actionsPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              titlePadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              title: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  const Gap(5),
                  Text(
                    "الخروج من التطبيق",
                    style: AppTextStyles.textStyle(
                      color: AppColors.c090909,
                      weight: FontWeight.w600,
                      size: 14,
                    ),
                  ),
                ],
              ),
              content: Text(
                "هل انت متاكد من انك تريد الخروج من التطبيق",
                style: AppTextStyles.textStyle(
                  color: AppColors.c090909,
                  weight: FontWeight.w400,
                  size: 14,
                ),
              ),
              actions: <Widget>[
                CustomButtonInternet(
                  height: 48,
                  width: 112.5,
                  horizontal: 0,
                  vertical: 0,
                  title: "تأكيد",
                  onTap: (){
                    exit(0);
                  },
                ),

                CustomButtonInternet(
                  height: 48,
                  width: 112.5,
                  horizontal: 0,
                  vertical: 0,
                  colorBg: AppColors.transparent,
                  borderColor: AppColors.c090909,
                  txtColor: AppColors.c090909,
                  title: "الغاء",
                  onTap: ()=>Navigator.pop(context),
                ),
              ],
            ),
      );
    }
    return WillPopScope(onWillPop: showExitPopUp, child: child);
  }
}