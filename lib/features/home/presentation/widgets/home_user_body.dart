import '../../../../core/src/app_export.dart';
import '../widgets/custom_select_service_type_home.dart';

class HomeUserBody extends StatelessWidget {
  const HomeUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  children: [
                    const CustomSliderWidget(),
                    Gap(15.h),
                    const CustomSelectServiceTypeHome(),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}