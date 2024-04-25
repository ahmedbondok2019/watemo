import '../../../../core/src/app_export.dart';
import '../../data/models/orders_model.dart';

class CustomOrdersList extends StatelessWidget {
  final List<String> ordersDateList;
  final List<List<OrdersModel>> ordersList;
  const CustomOrdersList({super.key,
    required this.ordersDateList,
    required this.ordersList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: ordersDateList.length,
      itemBuilder: (context, i) {
        final date = ordersDateList[i];
        final orders = ordersList[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w400,
                        color: AppColors.c090909,
                        size: 16),
                  ),

                  SvgPicture.asset(ImageConstants.arrowUp,)
                ],
              ),

              Column(
                children: orders.map((order) => CustomOrderCard(
                  title: order.serviceText,
                  image: order.image,
                  price: order.total.toString(),
                  date: date,
                  statusName: order.statusText,
                  status: order.statusId,
                )).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}