import '../../../../core/src/app_export.dart';
import '../widgets/custom_hadith_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CustomLoading(),
              );
            }
            if (state is HomeSuccess) {
              return Column(
                children: [
                  const HomeAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: Column(
                            children: [
                              const CustomSliderWidget(),
                              Gap(15.h),
                              const CustomServicesHome(),
                              Gap(15.h),
                              const CustomHadithHome(),
                            ],
                          ),
                      ),
                    ),
                  ),
                ],
              );
            }
            else {
              return const Center(
                child: CustomLoading(),
              );
            }
          },
        ),
      ),
    );
  }
}
