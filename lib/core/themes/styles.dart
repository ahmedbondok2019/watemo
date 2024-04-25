import '../src/app_export.dart';

class AppTextStyles {
  static TextStyle textStyle({
    Color? color,
    double? size,
    String? family,
    FontWeight? weight,
    List<Shadow>? shadow,
    double height = 1.3,
    double? letterSpacing,
    bool? isDecorated = false,
    TextDecoration? decoration,
    Color? decorationColor,
    bool? isItalic = false,
  }) {
    return TextStyle(
      inherit: true,
      color: color ?? AppColors.c051427,
      fontSize: (size ?? 14).sp,
      fontFamily: family ?? 'NeoSansArabic',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: decoration,
      letterSpacing: letterSpacing,
      decorationColor: decorationColor,
      shadows: shadow,
    );
  }
}