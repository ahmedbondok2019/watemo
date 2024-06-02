import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/user_order/orders_model.dart';

class CustomOrderCard extends StatelessWidget {
  final OrdersModel order;
  const CustomOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 92.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.08),
                spreadRadius: 0,
                blurRadius: 16,
                offset: const Offset(0, 0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: CustomNetworkImage(
                    imageUrl: order.image ?? "",
                    fit: BoxFit.cover,
                    width: 72.w,
                    height: 76.h,
                  ),
                ),
                Gap(5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.serviceText ?? "",
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w500,
                          color: AppColors.c090909,
                          size: 16),
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Text(
                          order.total.toString(),
                          textDirection: TextDirection.ltr,
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w700,
                              color: AppColors.c090909,
                              // color: AppColors.c2CB67D,
                              size: 16),
                        ),
                        Gap(5.w),
                        Text(
                          "ريال ",
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              color: AppColors.c090909,
                              size: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ]),

          CustomButtonInternet(
            height: 34,
            width: 103,
            horizontal: 0,
            size: 14,
            colorBg: order.statusId == 1
                ? AppColors.cF79C1E
                : order.statusId == 2
                  ? AppColors.c3BD163
                  : AppColors.primary,
            title: order.statusText ?? "",
            onTap: () {
              if(order.serviceTypeId != 3){
                Navigator.pushNamed(
                    context,
                    AppRoutes.trackingOrder,
                    arguments: order.id.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
