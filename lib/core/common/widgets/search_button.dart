import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/image_constants.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    required this.withCircle,
    this.bgColor,
    this.imageWidth,
    this.imageHeight,
  }) : super(key: key);
  final GestureTapCallback? onTap;
  final double? width;
  final double? height;
  final Color? bgColor;
  final bool withCircle;
  final double? imageWidth;
  final double? imageHeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Image.asset(
          ImageConstants.search,
          width: (width ?? 18).w,
          height: (height ?? 18).h,
        ),
    );
  }
}
