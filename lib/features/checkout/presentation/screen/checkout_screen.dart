import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/my_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/checkout_cubit.dart';
import '../../data/models/create_order/create_order_req_model.dart';
import '../widgets/custom_checkout_details_body.dart';

class CheckoutScreen extends StatelessWidget {
  final ServicesModel service;
  final CreateOrderReqModel order;
  const CheckoutScreen({super.key,
    required this.service,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "إتمام الطلب",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: CustomCheckoutDetailsBody(
                    service: service,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: confirmOrder()
    );
  }

  BlocConsumer<CheckoutCubit, CheckoutState> confirmOrder() {
    return BlocConsumer<CheckoutCubit, CheckoutState>(listener: (context, state) {
      if (state is CreateOrderFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is CreateOrderSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is CreateOrderLoading) {
        Navigator.pop(context);
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "متابعة طلب الخدمة",
          onTap: (){
            order.code = context.read<CheckoutCubit>().codeController.text.trim();
            showAnimatedDialog(context,
                MyDialog(
                description: "تاكيد طلب هذة الخدمة؟",
                isFailed: false,
                widthImage: 252,
                heightImage: 164,
                image: ImageConstants.confirm,
                onTapConfirm: () {
              context.read<CheckoutCubit>().createOrder(
                  order: order);
            },
            ),
                dismissible: false, isFlip: true);
          },
        );
      }
    });
  }
}