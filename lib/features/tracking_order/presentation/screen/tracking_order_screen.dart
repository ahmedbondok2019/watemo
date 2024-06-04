import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/tracking_order_cubit.dart';
import '../widgets/custom_bottom_sheet_tracking.dart';
import '../widgets/custom_tracking_videos_list.dart';

class TrackingOrderScreen extends StatefulWidget {
  final String orderId;
  const TrackingOrderScreen({Key? key,
    required this.orderId}) : super(key: key);

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}
class _TrackingOrderScreenState extends State<TrackingOrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TrackingOrderCubit>().getOrderTracking(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<TrackingOrderCubit, TrackingOrderState>(
            builder: (context, state) {
              if (state is GetOrderTrackingLoading ||
                  state is SetMarkerLoading) {
                return const Center(
                  child: CustomLoading(),
                );
              }
              if (state is GetOrderTrackingSuccess || state is SetMarkerSuccess) {
                return GoogleMap(
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  buildingsEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  padding: EdgeInsets.only(top: 900.h),
                  mapType: MapType.normal,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: context.read<TrackingOrderCubit>().kMapCenter,
                    zoom: 10.0,
                  ),
                  markers: Set.from(context.read<TrackingOrderCubit>().marker),
                  polylines: Set<Polyline>.of(context.read<TrackingOrderCubit>().mapPolyLines.values),
                  onMapCreated: context.read<TrackingOrderCubit>().onMapCreated,
                );
              }
              else {
                return const Center(
                  child: CustomLoading(),
                );
              }
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomAppBar(
                leading: CustomBackButton(
                  backgroundColor: AppColors.white,
                ),
                actions: [NotificationIcon(
                  backgroundColor: AppColors.white,
                )],
              ),

              Container(
                width: 390.w,
                height: 295.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r),
                    )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageConstants.logoApp,
                              width: 34.w,
                              height: 34.h,
                            ),
                            Gap(8.w),
                            Text(
                              "the_videos".tr(context),
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w600,
                                  color: AppColors.c090909,
                                  size: 16),
                            ),
                          ],
                        ),

                        /// button
                        CustomButtonInternet(
                          height: 36,
                          width: 110,
                          horizontal: 0,
                          vertical: 0,
                          size: 16,
                          weight: FontWeight.w600,
                          title: "service_status".tr(context),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: false,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BlocBuilder<TrackingOrderCubit,
                                  TrackingOrderState>(
                                  builder: (_, state) {
                                    return CustomBottomSheetTracking(
                                      steps: context.read<TrackingOrderCubit>().steps,
                                    );
                                  }),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(
                      width: 390.w,
                      height: 225.h,
                      child: BlocBuilder<TrackingOrderCubit,
                          TrackingOrderState>(
                        builder: (context, state) {
                          if (state is GetOrderTrackingLoading) {
                            return const Center(
                              child: CustomLoading(),
                            );
                          }
                          if (state is GetOrderTrackingSuccess ||
                              state is SetMarkerSuccess) {
                            return CustomTrackingVideosList(
                                videos: context.read<TrackingOrderCubit>().steps);
                          }
                          else {
                            return const Center(
                              child: CustomLoading(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}