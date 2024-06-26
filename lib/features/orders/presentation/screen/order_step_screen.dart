import 'package:video_player/video_player.dart';
import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../cubit/orders_cubit.dart';
import '../../data/models/user_order/orders_model.dart';
import '../widgets/custom_order_videos_list.dart';
import '../widgets/custom_steps_list.dart';

class OrderStepScreen extends StatelessWidget {
  final OrdersModel order;

  OrderStepScreen({super.key, required this.order});

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
              title: order.serviceType,
              titleSize: 16,
              leading: const CustomBackButton(),
              actions: [
                CustomDrawerIcon(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              ],
            ),
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
                  ]),
            ),
            Gap(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "notes".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c090909,
                        size: 16),
                  ),
                  Gap(10.h),
                  Text(
                    order.serviceDescription ?? "",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w400,
                        color: AppColors.c9A9A9A,
                        size: 16),
                  ),
                ],
              ),
            ),

            BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15.h),
                  CustomStepsList(
                      stepsList: context.read<OrdersCubit>().steppers),

                  /// videos
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Gap(25.h),
                          ordersCubit.steppers.isEmpty
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    CustomSeeAll(
                                      title: "videos".tr(context),
                                      onTap: () => Navigator.pushNamed(
                                          context, AppRoutes.orderAllVideos,
                                        arguments:  [
                                          ordersCubit.videos,
                                          ordersCubit.titles
                                        ]
                                      ),
                                    ),

                                    SizedBox(
                                      width: 375.w,
                                      height: 225.h,
                                      child: CustomOrderVideosList(
                                        videos: ordersCubit.videos,
                                      titles: ordersCubit.titles,
                                    )),
                                  ],
                                ),
                          Gap(15.h),

                          context.read<OrdersCubit>().isLastStep
                              ? const SizedBox()
                              : InkWell(
                            onTap: ordersCubit.recordVideo,
                            child: Container(
                              width: 361.w,
                              height: 155.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ordersCubit.myVideo == null
                                  ? Image.asset(
                                      ImageConstants.selectVideo,
                                      fit: BoxFit.fill,
                                    )
                                  : Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: ordersCubit
                                              .controller!.value.aspectRatio,
                                          child: VideoPlayer(
                                              ordersCubit.controller!),
                                        ),
                                        Center(
                                          child: GestureDetector(
                                            onTap: ordersCubit.playVideo,
                                            child: Container(
                                              width: 50.w,
                                              height: 50.h,
                                              decoration: const BoxDecoration(
                                                  color: AppColors.primary,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                  ordersCubit.controller!.value
                                                          .isPlaying
                                                      ? Icons.pause
                                                      : Icons.play_arrow,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              );
            }),

            const Spacer(),

            nextStepButton(),
            Gap(15.h),
          ],
        ),
      ),
    );
  }

  BlocConsumer<OrdersCubit, OrdersState> nextStepButton() {
    return BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) async {
      if (state is NextStepOrderVendorFailed) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is NextStepOrderVendorSuccess) {
        CustomMessage.showMessage(context,
            message: "stage_successfully_completed".tr(context),
            type: AlertType.success);
      }
    }, builder: (context, state) {
      if (state is NextStepOrderVendorLoading) {
        return const Center(child: CustomLoading(width: 345, height: 48));
      } else {
        return context.read<OrdersCubit>().isLastStep
            ? const SizedBox()
            : CustomButtonInternet(
          height: 48,
          width: 345,
          horizontal: 0,
          vertical: 0,
          size: 14,
          colorBg: AppColors.primary,
          title: "next_stage".tr(context),
          onTap: () {
            if(context.read<OrdersCubit>().myVideo == null){
              CustomMessage.showMessage(context,
                  message: "must_upload_video".tr(context),
                  type: AlertType.warning);
            }
            else{
              context.read<OrdersCubit>().nextStep(
                orderId: order.id.toString());
            }
          },
        );
      }
    });
  }
}