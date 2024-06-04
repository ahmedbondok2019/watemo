import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import '../../../../core/common/widgets/exit_app_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/main_tabs.dart';
import '../widgets/tab_bar.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({Key? key}) : super(key: key);
  @override
  State<MainLayer> createState() => _MainLayerState();
}
class _MainLayerState extends State<MainLayer>
    with TickerProviderStateMixin{

  var _bottomNavIndex = 0;
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <String>[
    ImageConstants.home,
    ImageConstants.orders,
    ImageConstants.emptyWallet,
    ImageConstants.setting,
  ];

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ExitPopUp(
        child: Scaffold(
          extendBody: true,
          body: NotificationListener<ScrollNotification>(
            onNotification: onScrollNotification,
            child: MainTabs(index: _bottomNavIndex),
          ),
          floatingActionButton: GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, AppRoutes.mediaCenter),
            child: Image.asset(
              ImageConstants.logo,
              width: 100.w,
              height: 110.h,
              fit: BoxFit.fill,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return TabBarTab(
                iconColor: isActive
                    ? AppColors.primary
                    : AppColors.c090909,
                label: index == 0
                    ? "main".tr(context)
                    : index == 1
                       ? "orders".tr(context)
                       : index == 2
                          ? "wallet".tr(context)
                          : "more".tr(context),
                icon: iconList[index],
              );
            },
            activeIndex: _bottomNavIndex,
            notchAndCornersAnimation: borderRadiusAnimation,
            splashSpeedInMilliseconds: 300,
            height: 90.h,
            notchSmoothness: NotchSmoothness.defaultEdge,
            notchMargin: -5,
            gapLocation: GapLocation.center,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            borderColor: AppColors.primary,
            hideAnimationController: _hideBottomBarAnimationController,
            shadow: const BoxShadow(
              offset: Offset(1, 0),
              blurRadius: 3,
              spreadRadius: 1,
              color: AppColors.primary,
            ),
          ),
        ));
  }
}