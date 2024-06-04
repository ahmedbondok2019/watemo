import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_profile_image.dart';
import '../../../../core/src/app_export.dart';
import '../../../auth/presentation/widgets/custom_drop_down_nat_res.dart';
import '../../cubit/orders_cubit.dart';
import '../widgets/custom_user_orders.dart';
import '../widgets/custom_vendor_orders.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    OrdersCubit ordersCubit = BlocProvider.of<OrdersCubit>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "orders".tr(context),
              titleSize: 16,
              leading: const CustomProfileImage(),
              actions: [
                AppConstants.userType == AppConstants.user ||
                        AppConstants.userType == AppConstants.company
                    ? const NotificationIcon()
                    : CustomDrawerIcon(
                        onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      ),
              ],
            ),
            Gap(15.h),
            BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
              return AppConstants.userType == AppConstants.user ||
                      AppConstants.userType == AppConstants.company
                  ? Container(
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
                            title: "all".tr(context),
                            horizontal: 0,
                            size: 16,
                            vertical: 0,
                            height: 40,
                            width: 115,
                            colorBg: ordersCubit.orderType == null
                                ? null
                                : AppColors.white,
                            txtColor: ordersCubit.orderType == null
                                ? null
                                : AppColors.c090909,
                            onTap: () {
                              ordersCubit.changeOrderType(null);
                            },
                          ),
                          CustomButtonInternet(
                            title: "processing".tr(context),
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
                            title: "completed".tr(context),
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
                            onTap: () {
                              ordersCubit.changeOrderType(2);
                            },
                          ),
                        ],
                      ),
                    )
                  : CustomDropDownNat(
                      list: ordersCubit.statusOrders,
                      selectedItem: ordersCubit.statusOrder,
                      width: 361,
                      height: 48,
                      isDate: false,
                      borderColor: AppColors.cE3DCC4,
                      bgColor: AppColors.white,
                      onChanged: ordersCubit.changeStatusOrder,
                      label: "all_orders",
                      isTrans: true,
                    );
            }),
            Gap(5.h),

            AppConstants.userType == AppConstants.user ||
                AppConstants.userType == AppConstants.company
                ? const CustomUserOrder()
                : const CustomVendorOrder()
          ],
        ),
      ),
    );
  }
}
