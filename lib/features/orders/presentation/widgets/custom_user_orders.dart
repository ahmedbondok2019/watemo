import '../../../../core/common/widgets/custom_no_result.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/orders_cubit.dart';
import 'custom_orders_list.dart';

class CustomUserOrder extends StatelessWidget {
  const CustomUserOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      if (state is OrdersLoading) {
        return const Expanded(
            child: Center(
          child: CustomLoading(),
        ));
      }
      if (state is OrdersSuccess) {
        return context.read<OrdersCubit>().ordersDateList.isEmpty
            ? Expanded(
                child: Center(
                    child: CustomNoResult(title: "no_orders".tr(context))))
            : Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomOrdersList(
                          ordersDateList:
                              context.read<OrdersCubit>().ordersDateList,
                          ordersList: context.read<OrdersCubit>().ordersList,
                        ))));
      } else {
        return const Expanded(
            child: Center(
          child: CustomLoading(),
        ));
      }
    });
  }
}
