import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/services_cubit.dart';
import '../widgets/custom_services_list.dart';

class ServicesScreen extends StatelessWidget {
  final TitleIdListModel titleId;
  const ServicesScreen({super.key,required this.titleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: titleId.title,
              titleSize: 16,
              leading: const CustomBackButton(),
              actions: const [NotificationIcon()],
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
                            servicesList: context.read<ServicesCubit>().servicesList,
                            titleId: titleId
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
