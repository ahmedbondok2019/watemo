
import '../src/app_export.dart';
import 'custom_message.dart';

class SnackBarMessageIcon extends StatelessWidget {
  final AlertType type;
  const SnackBarMessageIcon({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(end: 15.w),
        alignment: Alignment.center,
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: type == AlertType.success
                ? AppColors.green
                : type == AlertType.failed
                    ? AppColors.red
                    : type == AlertType.warning
                        ? AppColors.lightOrange
                        : AppColors.blue),
        child: Icon(
          type == AlertType.success
              ? Icons.check
              : type == AlertType.failed
                  ? Icons.error_outline
                  : type == AlertType.warning
                      ? Icons.warning_rounded
                      : type == AlertType.information
                          ? Icons.info
                          : Icons.info_outline,
          size: 24,
          color: AppColors.white,
        ));
  }
}
