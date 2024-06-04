import '../../../../core/common/widgets/custom_no_result.dart';
import '../../../../core/src/app_export.dart';
import '../../../orders/presentation/widgets/custom_orders_vendor_list.dart';
import 'custom_total_order_home.dart';

class HomeVendorBody extends StatelessWidget {
  const HomeVendorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading && context.read<HomeCubit>().orders.isEmpty) {
          return Expanded( child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(20.h),
                const CustomTotalOrderHome(),
                Gap(25.h),
                CustomSeeAll(
                  title: "orders".tr(context),
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.orders),
                ),

                const Expanded(child: Center(child: CustomLoading(),),),
              ],
            ),
          ),
          );
        }
        else if (state is HomeLoading ||
            state is HomeSuccess ||
            state is AcceptHomeOrderVendorLoading ||
            state is AcceptHomeOrderVendorSuccess ||
            state is RefuseHomeOrderVendorLoading ||
            state is RefuseHomeOrderVendorSuccess) {
          return Expanded( child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(20.h),
                const CustomTotalOrderHome(),
                Gap(25.h),
                CustomSeeAll(
                  title: "orders".tr(context),
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.orders),
                ),

                Expanded(
                  child: context.read<HomeCubit>().orders.isEmpty
                      ? Center(
                      child: CustomNoResult(title: "no_new_orders".tr(context)))
                      : SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomOrdersVendorList(
                          ordersList: context.read<HomeCubit>().orders,
                          isHome: true,
                        ),

                        Gap(50.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          );
        }
        else {
          return Expanded( child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(20.h),
                const CustomTotalOrderHome(),
                Gap(25.h),
                CustomSeeAll(
                  title: "orders".tr(context),
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.orders),
                ),

                const SizedBox(),
              ],
            ),
          ));
        }
      },
    );
  }
}