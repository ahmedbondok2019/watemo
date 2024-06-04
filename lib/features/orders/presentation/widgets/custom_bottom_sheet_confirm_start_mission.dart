import 'package:completed/features/orders/data/models/user_order/orders_model.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../../core/utils/utils.dart';
import '../../cubit/orders_cubit.dart';

class CustomBottomSheetStartMission extends StatelessWidget {
  final OrdersModel order;

  const CustomBottomSheetStartMission({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      return Container(
        width: 393.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(15.h),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                height: 95.h,
                width: 361.w,
                decoration: BoxDecoration(
                    color: AppColors.cF6F4EC,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.cE3DCC4)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: CustomNetworkImage(
                          imageUrl: order.image ?? "",
                          fit: BoxFit.cover,
                          width: 82.w,
                          height: 82.h,
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        order.serviceText ?? "",
                                        style: AppTextStyles.textStyle(
                                            weight: FontWeight.w700,
                                            color: AppColors.c090909,
                                            size: 16),
                                      ),
                                      CustomButtonInternet(
                                        height: 30,
                                        width: 77,
                                        horizontal: 0,
                                        vertical: 0,
                                        size: 14,
                                        weight: FontWeight.w400,
                                        colorBg: order.statusId == 0
                                            ? AppColors.c00D261
                                            : order.statusId == 1
                                                ? AppColors.cF79C1E
                                                : AppColors.primary,
                                        title: order.statusText ?? "",
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(10.w),
                                Row(
                                  children: [
                                    Text(
                                      "on_behalf_of".tr(context),
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w400,
                                          color: AppColors.c090909,
                                          size: 16),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      order.onBehalfOf ?? "",
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w400,
                                          color: AppColors.c090909,
                                          size: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ])),
            Gap(15.h),
            Text(
              order.serviceDescription ?? "",
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w400, color: AppColors.c9A9A9A, size: 16),
            ),
            Gap(20.h),
            buttonStartMissionWidget(),
            Gap(20.h),
          ],
        ),
      );
    });
  }

  BlocConsumer<OrdersCubit, OrdersState> buttonStartMissionWidget() {
    return BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) async {
      if (order.statusId == 0 && state is StartMissionOrderVendorFailed) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      } else if (state is StartMissionOrderVendorSuccess) {
        CustomMessage.showMessage(context,
            message: "started_task_successful".tr(context), type: AlertType.success);
        Navigator.pushNamed(
          context,
          AppRoutes.orderStep,
          arguments: order,
        );
      }
    }, builder: (context, state) {
      if (state is StartMissionOrderVendorLoading) {
        return const Center(child: CustomLoading(width: 345, height: 48));
      } else {
        return CustomButtonInternet(
          height: 48,
          width: 345,
          horizontal: 0,
          vertical: 0,
          size: 14,
          colorBg: AppColors.primary,
          title:
              order.hasSteps!
                  ? "confirm_complete_started_task".tr(context)
                  : "confirm_started_task".tr(context),
          onTap: () {
            Utils.checkLocationEnabled()
                .then((value) {
              if (value) {
                Utils.checkLocationPermission()
                    .then((value) {
                  if (value) {
                    context
                        .read<OrdersCubit>()
                        .startMissionOrderVendor(orderId: order.id.toString());
                  } else {
                    CustomMessage.showMessage(
                        context,
                        message:
                        "allow_to_access_location".tr(context),
                        type: AlertType.warning);
                  }
                });
              } else {
                CustomMessage.showMessage(context,
                    message:
                    "must_open_location".tr(context),
                    type: AlertType.warning);
              }
            });
          },
        );
      }
    });
  }
}
