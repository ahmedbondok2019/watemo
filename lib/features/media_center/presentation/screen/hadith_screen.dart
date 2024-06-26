import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/media_center_cubit.dart';
import '../widgets/custom_hadith_list.dart';

class HadithScreen extends StatelessWidget {
  HadithScreen({super.key});
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
            CustomAppBar(
              title: "hadith".tr(context),
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

            BlocBuilder<MediaCenterCubit, MediaCenterState>(
              builder: (context, state) {
                if (state is HadithLoading) {
                  return const Expanded(
                    child: CustomLoading(),);
                }
                if (state is HadithSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Gap(15.h),
                            CustomHadithList(
                                hadithList: context.read<MediaCenterCubit>()
                                    .hadithList),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return const Expanded(
                    child: CustomLoading(),);
                }
              },
            ),
          ],
        )
      ),
    );
  }
}