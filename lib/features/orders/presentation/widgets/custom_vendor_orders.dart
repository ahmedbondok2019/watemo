import '../../../../core/common/widgets/custom_no_result.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/orders_cubit.dart';
import 'custom_orders_vendor_list.dart';

class CustomVendorOrder extends StatelessWidget {
  const CustomVendorOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      if (state is OrdersLoading) {
        return const Expanded(
            child: Center(
          child: CustomLoading(),
        ));
      }
      if (state is OrdersSuccess ||
          state is AcceptOrderVendorLoading ||
          state is AcceptOrderVendorSuccess ||
          state is RefuseOrderVendorSuccess
      ) {
        return context.read<OrdersCubit>().ordersVendorList.isEmpty
            ? Expanded(
                child: Center(
                    child: CustomNoResult(title: "no_orders".tr(context))))
            : Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            CustomOrdersVendorList(
                              ordersList:
                                  context.read<OrdersCubit>().ordersVendorList,
                            ),
                            Gap(85.h),
                          ],
                        ),
                    ),
                ),
        );
      } else {
        return const Expanded(
            child: Center(
          child: CustomLoading(),
        ));
      }
    });
  }
}
