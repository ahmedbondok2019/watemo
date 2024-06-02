import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_aboutUs_body.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppConstants.userType == AppConstants.user ||
          AppConstants.userType == AppConstants.company
          ? null
          : const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "عن التطبيق",
              titleSize: 16,
              leading: const CustomBackButton(),
              actions: [
                AppConstants.userType == AppConstants.user ||
                    AppConstants.userType == AppConstants.company
                    ? const NotificationIcon()
                    : CustomDrawerIcon(
                  onTap: ()=> _scaffoldKey.currentState?.openDrawer(),
                ),
              ],
            ),

            BlocBuilder<OtherPageCubit, OtherPageState>(
              builder: (context, state) {
                if (state is AboutUsLoading) {
                  return const Expanded(
                      child: Center(
                        child: CustomLoading(),
                      ));
                }
                else if (state is AboutUsSuccess) {
                  return const Expanded(
                      child: CustomAboutUsBody());
                }
                else {
                  return const Expanded(
                    child: Center(
                        child: CustomLoading()),
                  );
                }
              },
            ),
          ],
        )
      ),
    );
  }
}
