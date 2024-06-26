import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../../core/utils/utils.dart';
import '../../cubit/orders_cubit.dart';
import '../../data/models/user_order/orders_model.dart';
import 'custom_bottom_sheet_confirm_start_mission.dart';

class CustomOrderVendorCard extends StatelessWidget {
  final OrdersModel order;
  const CustomOrderVendorCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      height: order.statusId == 2 ? null : 185.h,
      width: 361.w,
      decoration: BoxDecoration(
          color: AppColors.cF6F4EC,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.cE3DCC4)),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: CustomNetworkImage(
                    imageUrl: order.image ?? "",
                    fit: BoxFit.cover,
                    width: 82.w,
                    height: 95.h,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                          Gap(8.w),
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
                          Gap(8.w),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "date_from".tr(context),
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        color: AppColors.c090909,
                                        size: 14),
                                  ),
                                  Text(
                                    order.dateFrom ?? "",
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        color: AppColors.c090909,
                                        size: 12),
                                  ),
                                ],
                              ),

                              Gap(8.w),

                              Row(
                                children: [
                                  Text(
                                    "to".tr(context),
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        color: AppColors.c090909,
                                        size: 14),
                                  ),
                                  Text(
                                    order.dateTo ?? "",
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        color: AppColors.c090909,
                                        size: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),

          Gap(8.h),

          buttonWidget()
        ],
      ),
    );
  }

  BlocConsumer<OrdersCubit, OrdersState> buttonWidget() {
    return BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) async {
      if (order.statusId == 0 && state is AcceptOrderVendorFailed) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (order.statusId == 0 && state is RefuseOrderVendorFailed) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is AcceptOrderVendorSuccess) {
        CustomMessage.showMessage(context,
            message: "accept_order_successful".tr(context), type: AlertType.success);
      }
      else if (state is RefuseOrderVendorSuccess) {
        CustomMessage.showMessage(context,
            message: "reject_order_successful".tr(context), type: AlertType.success);
      }
    },
        builder: (context, state) {
      if (state is AcceptOrderVendorLoading && order.statusId == 0 &&
          state.orderId == order.id.toString()) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(child: CustomLoading(width: 165, height: 48)),
            CustomButtonInternet(
              height: 48,
              width: 165,
              horizontal: 0,
              vertical: 0,
              size: 14,
              colorBg: AppColors.white,
              borderColor: AppColors.c090909,
              title: "reject".tr(context),
              onTap: () {
                context
                    .read<OrdersCubit>()
                    .refuseOrderVendor(orderId: order.id.toString());
              },
            ),
          ],
        );
      }
      else if (state is RefuseOrderVendorLoading && order.statusId == 0 &&
          state.orderId == order.id.toString()) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonInternet(
              height: 48,
              width: 165,
              horizontal: 0,
              vertical: 0,
              size: 14,
              colorBg: AppColors.primary,
              title: "accept".tr(context),
              onTap: () {
                context
                    .read<OrdersCubit>()
                    .acceptOrderVendor(orderId: order.id.toString());
              },
            ),
            const Center(child: CustomLoading(width: 165, height: 48)),
          ],
        );
      }
      else {
        return order.statusId == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonInternet(
                    height: 48,
                    width: 165,
                    horizontal: 0,
                    vertical: 0,
                    size: 14,
                    colorBg: AppColors.primary,
                    title: "accept".tr(context),
                    onTap: () {
                      context
                          .read<OrdersCubit>()
                          .acceptOrderVendor(orderId: order.id.toString());
                    },
                  ),
                  CustomButtonInternet(
                    height: 48,
                    width: 165,
                    horizontal: 0,
                    vertical: 0,
                    size: 14,
                    colorBg: AppColors.white,
                    borderColor: AppColors.c090909,
                    title: "reject".tr(context),
                    onTap: () {
                      context
                          .read<OrdersCubit>()
                          .refuseOrderVendor(orderId: order.id.toString());
                    },
                  ),
                ],
              )
            : order.statusId == 1
                ? CustomButtonInternet(
                    height: 48,
                    width: 345,
                    horizontal: 0,
                    vertical: 0,
                    size: 14,
                    colorBg: order.dateToStartNumber! > 0
                        ? AppColors.cE3DCC4
                        : AppColors.primary,
                    title: order.dateToStartNumber! > 0
                        ? order.dateToStart!
                        : order.hasSteps!
                        ? "complete_started_task".tr(context)
                        : "started_task".tr(context),
                    onTap: () {
                      if(order.dateToStartNumber == 0){
                        Utils.checkLocationEnabled()
                            .then((value) {
                          if (value) {
                            Utils.checkLocationPermission()
                                .then((value) {
                              if (value) {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      BlocBuilder<OrdersCubit, OrdersState>(
                                          builder: (context, state) {
                                            return CustomBottomSheetStartMission(
                                              order: order,
                                            );
                                          }),
                                );
                              } else {
                                CustomMessage.showMessage(
                                    context,
                                    message:
                                    "must_allow_location".tr(context),
                                    type: AlertType.warning);
                              }
                            });
                          } else {
                            CustomMessage.showMessage(context,
                                message:
                                "must_allow_permission_loc".tr(context),
                                type: AlertType.warning);
                          }
                        });
                      }
                    },
                  )
                : const SizedBox();
      }
    });
  }
}