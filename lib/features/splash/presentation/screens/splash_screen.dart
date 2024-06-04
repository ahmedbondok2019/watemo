import '../../../../core/src/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotateAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _visibilityAnimation;
  late final Completer _rotationCompleter = Completer();

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rotateAnimation = Tween<double>(
      begin: -1,
      end: 0,
    ).animate(_rotationController);

    _rotationController.forward().then((_) {
      _rotationController.stop();
      if (!_rotationCompleter.isCompleted) {
        _rotationCompleter.complete();
      }
    });

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(_slideController);

    _visibilityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _rotationCompleter.future.then((_) {
      _slideController.forward();
    });

    _slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });
  }
  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(seconds: 1),
        child: SelectLangScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(
        children: [
          RotationTransition(
            turns: _rotateAnimation,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                ImageConstants.background,
                width: double.infinity,
                fit: BoxFit.fill,
                opacity:const AlwaysStoppedAnimation(.3),
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              AnimatedBuilder(
                animation: _visibilityAnimation,
                builder: (context, child) {
                  return Visibility(
                    visible: _visibilityAnimation.value > 0,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Hero(
                        tag: 'Completed',
                        child: Image.asset(
                          ImageConstants.logoSplash,
                          fit: BoxFit.contain,
                          width: 202.w,
                          height: 112.h,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 70.h),
                child: Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                    turns: _rotateAnimation,
                    child: Text(
                      "splash_textِ".tr(context),
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w500,
                          color: AppColors.c090909,
                          size: 24.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}