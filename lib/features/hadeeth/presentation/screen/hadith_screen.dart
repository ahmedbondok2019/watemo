import '../../../../core/src/app_export.dart';
import '../../cubit/hadith_cubit.dart';
import '../widgets/custom_hadith_list.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "أحاديث نبوية",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            BlocProvider<HadithCubit>(
              create: (context) => getIt<HadithCubit>()
                ..getAllHadith(),
              child: BlocBuilder<HadithCubit, HadithState>(
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
                              CustomHadithList(hadithList: context.read<HadithCubit>().hadithList),
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
            ),
          ],
        )
      ),
    );
  }
}