import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_order_videos_list.dart';

class OrderAllVideosScreen extends StatelessWidget {
  final List<String> videos;
  final List<String> titles;
  OrderAllVideosScreen({super.key,
    required this.videos,
    required this.titles,
  });
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
              title: "stage_videos".tr(context),
              titleSize: 16,
              leading: const CustomBackButton(),
              actions: [
                CustomDrawerIcon(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              ],
            ),
            Gap(15.h),

            /// videos
            Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      videos.isEmpty
                          ? const SizedBox()
                          : CustomOrderVideosList(
                        videos: videos,
                        titles: titles,
                        isAll: true,
                      ),

                      Gap(25.h),
                    ],
                  ),
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}