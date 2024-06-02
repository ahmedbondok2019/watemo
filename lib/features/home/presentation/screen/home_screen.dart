import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/home_user_body.dart';
import '../widgets/home_vendor_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomAppDrawer(),
      body: BackgroundComponent(
          opacity: 0.2,
          child: Column(
            children: [
              HomeAppBar(scaffoldKey: _scaffoldKey),

              AppConstants.userType == AppConstants.user ||
                  AppConstants.userType == AppConstants.company
                  ? const HomeUserBody()
                  : const HomeVendorBody()
            ],
          ),
      ),
    );
  }
}