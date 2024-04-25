import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../checkout/data/models/create_order/create_order_req_model.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/providers_cubit.dart';
import '../widgets/custom_providers_list.dart';

class ProvidersScreen extends StatelessWidget {
  final ServicesModel service;
  final List<int> selectLang;
  final CreateOrderReqModel orderDetails;
  const ProvidersScreen({super.key,
    required this.service,
    required this.selectLang,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "إختيار مقدم الخدمة",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            BlocBuilder<ProvidersCubit, ProvidersState>(
              builder: (context, state) {
                if (state is ProvidersLoading) {
                  return const Center(
                    child: CustomLoading(),
                  );
                }
                if (state is ProvidersSuccess || state is ChangeProviderSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const CustomProvidersList(),
                      ),
                    ),
                  );
                }
                else {
                  return const Center(
                    child: CustomLoading(),
                  );
                }
              },
            ),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonInternet(
        height: 48,
        width: 361,
        horizontal: 0,
        title: "التالي",
        onTap: (){
          if (context.read<ProvidersCubit>().provider == null) {
            CustomMessage.showMessage(context,
                message: "يجب اختيار شخص مادي الخدمه",
                type: AlertType.warning);
          }
          else{
            orderDetails.vendorId = context.read<ProvidersCubit>().provider.toString();
                Navigator.pushNamed(
                    context, AppRoutes.checkout,
                    arguments: [
                      service,
                      orderDetails,
                    ]
                );
          }
        },
      ),
    );
  }
}
