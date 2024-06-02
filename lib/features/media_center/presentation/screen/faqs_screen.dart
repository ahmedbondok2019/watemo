import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/media_center_cubit.dart';
import '../widgets/custom_faqs_list.dart';

class FaqsScreen extends StatelessWidget {
  FaqsScreen({super.key});
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
              title: "الاسئلة الشائعه",
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
                if (state is GetAllFaqsLoading) {
                  return const Expanded(
                    child: CustomLoading());
                }
                if (state is GetAllFaqsSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: CustomFaqsList(
                            faqs: context.read<MediaCenterCubit>()
                                .faqs),
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