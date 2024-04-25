import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/image_constants.dart';

class ShareButton extends StatelessWidget {
  const ShareButton(
      {Key? key, this.onTap, this.bgColor, this.width, this.height})
      : super(key: key);
  final GestureTapCallback? onTap;
  final Color? bgColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        width: (width ?? 38).w,
        height: (height ?? 38).h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor ?? Colors.black.withOpacity(0.15),
        ),
        child: Image.asset(
          ImageConstants.share,
          width: 18.w,
          height: 18.h,
        ),
      ),
    );
  }
}