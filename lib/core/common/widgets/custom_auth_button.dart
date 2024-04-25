import '../../src/app_export.dart';

class CustomAuthButton extends StatelessWidget {
  final Function()? onTap;
  final double? height;
  final double? width;
  final String title;
  const CustomAuthButton(
      {super.key, this.onTap, this.height, this.width, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: width ?? 312,
        height: height ?? 52,
        decoration: ShapeDecoration(
          color: Color(0XFFC78C5C),
          // gradient: const LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.topRight,
          //   colors: [Color(0xFFC78C5C), Color(0XFFF6E5C3)],
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.67),
            side: const BorderSide(
              color: Color(0XFFF6E5C3),
              width: 1,
            ),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 4.43,
              offset: Offset(0, 4.43),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 0,
              offset: Offset(0, 0),
              spreadRadius: 2.53,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -2,
              left: 10,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(0.67),
                child: Container(
                  width: 6.20,
                  height: 12.77,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: AppTextStyles.textStyle(
                color: AppColors.white,
                size: 22,
                weight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
