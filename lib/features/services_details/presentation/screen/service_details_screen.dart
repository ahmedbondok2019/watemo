import '../../../../core/src/app_export.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/service_details_cubit.dart';
import '../widgets/custom_service_details_body.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServicesModel service;
  const ServiceDetailsScreen({super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
          opacity: 0.2,
          child: Column(
            children: [
              CustomAppBar(
                title: service.title,
                titleSize: 16,
                leading: const CustomBackButton(),
                actions: const [NotificationIcon()],
              ),

              BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
                  builder: (context, state) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomServiceDetailsBody(
                          service: service,
                      ),
                    ),
                  ),
                );
              }),
            ],
          )),
    );
  }
}
