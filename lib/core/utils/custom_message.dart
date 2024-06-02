import '../src/app_export.dart';
import 'message_icon.dart';

enum AlertType {
  success,
  failed,
  warning,
  information,
}

class CustomMessage {
  static showMessage(BuildContext context,
      {required String message,
      required AlertType type,
      bool? showCloseIcon,
      Duration? duration}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.up,
      closeIconColor: type == AlertType.success
          ? AppColors.green
          : type == AlertType.failed
              ? AppColors.red
              : type == AlertType.warning
                  ? AppColors.lightOrange
                  : AppColors.blue,
      showCloseIcon: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5.r),
          side: BorderSide(
              width: 1.sp,
              color: type == AlertType.success
                  ? AppColors.green
                  : type == AlertType.failed
                      ? AppColors.red
                      : type == AlertType.warning
                          ? AppColors.lightOrange
                          : AppColors.blue)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsetsDirectional.only(top: 50.h, start: 25.w, end: 25.w),
      padding: EdgeInsetsDirectional.only(
          top: 10.h, bottom: 10.h, start: 10.w, end: 10.w),
      duration: duration ?? const Duration(seconds: 4),
      content: Row(
        children: [
          SnackBarMessageIcon(type: type),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.textStyle(
                size: 14,
                weight: FontWeight.w300,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            child: Icon(
              Icons.close,
              color: type == AlertType.success
                  ? AppColors.green
                  : type == AlertType.failed
                      ? AppColors.red
                      : type == AlertType.warning
                          ? AppColors.lightOrange
                          : AppColors.blue,
              size: 24,
            ),
          )
        ],
      ),
      backgroundColor: AppColors.white,
    ));
  }
}
