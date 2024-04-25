import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../widgets/custom_orders_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCubit ordersCubit = BlocProvider.of<OrdersCubit>(context);
    return Scaffold(
      body: BackgroundComponent(
          opacity: 0.2,
          child: Column(
            children: [
              Column(
                children: [
                  CustomAppBar(
                    title: "الطلبات",
                    titleSize: 16,
                    leading: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CustomNetworkImage(
                        imageUrl: EndPoints.baseImageUrl +
                            context.read<HomeCubit>()
                                .user!.image!,
                        fit: BoxFit.fill,
                        height: 164.h,
                        width: 361.w,
                      ),
                    ),
                    actions: const [NotificationIcon()],
                  ),
                  Gap(20.h),
                  BlocBuilder<OrdersCubit, OrdersState>(
                      builder: (context, state) {
                    return Container(
                      height: 56.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.12),
                            blurRadius: 24,
                            offset: const Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButtonInternet(
                            title: "الكل",
                            horizontal: 0,
                            size: 16,
                            vertical: 0,
                            height: 40,
                            width: 115,
                            colorBg: ordersCubit.orderType == 0
                                ? null
                                : AppColors.white,
                            txtColor: ordersCubit.orderType == 0
                                ? null
                                : AppColors.c090909,
                                // : AppColors.c9A9A9A,
                            onTap: () {
                              ordersCubit.changeOrderType(0);
                            },
                          ),
                          CustomButtonInternet(
                            title: "قيد التنفيذ",
                            horizontal: 0,
                            size: 16,
                            vertical: 0,
                            height: 40,
                            width: 115,
                            colorBg: ordersCubit.orderType == 1
                                ? null
                                : AppColors.white,
                            txtColor: ordersCubit.orderType == 1
                                ? null
                                : AppColors.c090909,
                                // : AppColors.c9A9A9A,
                            onTap: () {
                              ordersCubit.changeOrderType(1);
                            },
                          ),
                          CustomButtonInternet(
                            title: "اكتملت",
                            horizontal: 0,
                            size: 16,
                            vertical: 0,
                            height: 40,
                            width: 115,
                            colorBg: ordersCubit.orderType == 2
                                ? null
                                : AppColors.white,
                            txtColor: ordersCubit.orderType == 2
                                ? null
                                : AppColors.c090909,
                                // : AppColors.c9A9A9A,
                            onTap: () {
                              ordersCubit.changeOrderType(2);
                            },
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: BlocBuilder<OrdersCubit, OrdersState>(
                          builder: (context, state) {
                        return CustomOrdersList(
                            ordersDateList: OrdersCubit.get(context).ordersDateList,
                            ordersList: OrdersCubit.get(context).ordersList,
                        );
                      })),
                ),
              ),
            ],
          )),
    );
  }
}
