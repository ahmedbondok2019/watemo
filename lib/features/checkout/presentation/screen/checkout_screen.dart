import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/confirm_order_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../home/data/models/hajj_model.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/checkout_cubit.dart';
import '../../data/models/create_order/create_order_req_model.dart';
import '../widgets/custom_checkout_details_body.dart';

class CheckoutScreen extends StatelessWidget {
  final ServicesModel? service;
  final CreateOrderReqModel order;
  final HajjModel? hajj;
  final List<ServicesModel> selectServicesList;

  const CheckoutScreen({
    super.key,
    required this.service,
    required this.hajj,
    required this.order,
    required this.selectServicesList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundComponent(
            opacity: 0.2,
            child: Column(
              children: [
                CustomAppBar(
                  title: "confirm_order".tr(context),
                  titleSize: 16,
                  leading: const CustomBackButton(),
                  actions: const [NotificationIcon()],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: CustomCheckoutDetailsBody(
                        service: service,
                        hajj: hajj,
                        selectServices: selectServicesList,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: confirmOrder());
  }

  BlocConsumer<CheckoutCubit, CheckoutState> confirmOrder() {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
      if (state is CreateOrderFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      } else if (state is CreateOrderSuccess) {
        CustomMessage.showMessage(context,
            message: state.message, type: AlertType.success);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is CreateOrderLoading) {
        Navigator.pop(context);
        return const Center(child: CustomLoading());
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "follow_confirm_order".tr(context),
          onTap: () {
            List<List<String>>? servicesList = [];
            if (hajj != null) {
              servicesList.add([hajj!.id.toString(), "1"]);
            } else {
              servicesList
                  .add([service!.id.toString(), service!.counter.toString()]);
            }
            for (var element in selectServicesList) {
              servicesList
                  .add([element.id.toString(), element.counter.toString()]);
            }

            order.services = servicesList;
            showAnimatedDialog(
                context,
                ConfirmOrderDialog(
                  description: "confirm_order_service".tr(context),
                  isFailed: false,
                  widthImage: 252,
                  heightImage: 164,
                  image: ImageConstants.confirm,
                  onTapConfirm: () {
                    context.read<CheckoutCubit>().createOrder(order: order);
                  },
                ),
                dismissible: false,
                isFlip: true);
          },
        );
      }
    });
  }
}
