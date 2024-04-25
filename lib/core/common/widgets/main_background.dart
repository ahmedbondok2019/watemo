import '../../../../core/src/app_export.dart';

class BackgroundComponent extends StatelessWidget {
  final Widget child;
  final double? opacity;
  const BackgroundComponent({super.key,
    required this.child,this.opacity});
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Image.asset(
            ImageConstants.background,
            width: double.infinity,
            fit: BoxFit.fill,
            opacity: AlwaysStoppedAnimation(opacity ?? 0.3),
          ),

          child
        ]
    );
  }
}
