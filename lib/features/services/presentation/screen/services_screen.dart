import '../../../../core/src/app_export.dart';
import '../../cubit/services_cubit.dart';
import '../widgets/custom_services_list.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "الخدمات",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return const Expanded(
                    child: CustomLoading());
                }
                if (state is ServicesSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomServicesList(
                            servicesList: context.read<ServicesCubit>().servicesList
                        ),
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
