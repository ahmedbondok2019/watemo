import '../../../../core/src/app_export.dart';
import '../../../home/presentation/widgets/custom_home_order_vendor_card.dart';
import '../../data/models/user_order/orders_model.dart';
import 'custom_order_vendor_card.dart';

class CustomOrdersVendorList extends StatelessWidget {
  final List<OrdersModel> ordersList;
  final bool isHome;

  const CustomOrdersVendorList(
      {super.key, required this.ordersList, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: ordersList.length,
      itemBuilder: (context, i) {
        final order = ordersList[i];
        return isHome
            ? CustomHomeOrderVendorCard(
          order: order,
        )
            : CustomOrderVendorCard(
          order: order,
        );
      },
    );
  }
}
