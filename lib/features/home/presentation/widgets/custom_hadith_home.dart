import '../../../../core/src/app_export.dart';
import '../../../hadeeth/presentation/widgets/custom_hadith_list.dart';

class CustomHadithHome extends StatelessWidget {
  const CustomHadithHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
      return Column(
      children: [
        CustomSeeAll(
          title: "أحاديث نبوية",
          onTap: () => Navigator.pushNamed(context, AppRoutes.hadithScreen),
        ),

        CustomHadithList(hadithList: context.read<HomeCubit>().hadithList),
      ],
    );});
  }
}