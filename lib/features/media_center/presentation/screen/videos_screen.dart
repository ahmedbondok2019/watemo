import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/media_center_cubit.dart';
import '../widgets/custom_videos_list.dart';

class VideosScreen extends StatelessWidget {
  VideosScreen({super.key});
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
              title: "the_videos".tr(context),
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

            Gap(20.h),
            Image.asset(ImageConstants.logoSplash,
              width: 132.w,
              height: 73.h,
            ),
            Gap(30.h),

            BlocBuilder<MediaCenterCubit, MediaCenterState>(
              builder: (context, state) {
                if (state is GetAllVideosLoading) {
                  return const Expanded(
                    child: CustomLoading());
                }
                if (state is GetAllVideosSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: CustomVideosList(
                            videos: context.read<MediaCenterCubit>()
                                .videos),
                      ),
                    ),
                  );
                }
                else {
                  return const Expanded(
                    child: CustomLoading());
                }
              },
            ),
          ],
        )
      ),
    );
  }
}