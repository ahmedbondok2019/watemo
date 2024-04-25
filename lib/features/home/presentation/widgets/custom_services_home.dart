import '../../../../core/src/app_export.dart';
import '../../../services/presentation/widgets/custom_services_list.dart';

class CustomServicesHome extends StatelessWidget {
  const CustomServicesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
      return Column(
        children: [
          CustomSeeAll(
            title: "الخدمات",
            onTap: () => Navigator.pushNamed(context,
                AppRoutes.servicesScreen),
          ),
          CustomServicesList(
              servicesList: context.read<HomeCubit>().servicesList),
        ],
      );
    });
  }
}
