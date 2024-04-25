import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/tracking_order_cubit.dart';
import '../../cubit/tracking_order_state.dart';

class TrackingOrderScreen extends StatefulWidget {
  const TrackingOrderScreen({Key? key}) : super(key: key);
  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}
class _TrackingOrderScreenState extends State<TrackingOrderScreen> {

  @override
  Widget build(BuildContext context) {
    TrackingOrderCubit trackingOrderCubit = BlocProvider.of<TrackingOrderCubit>(context, listen: false);
    return BlocBuilder<TrackingOrderCubit, TrackingOrderState>(
      builder: (context, state) {
        if (state is OrderLocationLoading) {
          return const Center(
            child: CustomLoading(),
          );
        }
        if (state is HomeSuccess) {
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                buildingsEnabled: true,
                compassEnabled: true,
                scrollGesturesEnabled: true,
                rotateGesturesEnabled: true,
                tiltGesturesEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.hybrid,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: trackingOrderCubit.kMapCenter,
                  zoom: 10.151926040649414,
                ),
                markers: Set.from(trackingOrderCubit.marker),
                onMapCreated: trackingOrderCubit.onMapCreated,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(55.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomAppBar(
                          leading: CustomBackButton(),
                          actions: [NotificationIcon()],
                        ),

                        Container(
                          width: 390.w,
                          height: 233.h,
                          margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
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
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Gap(8.w),
                                      Text(
                                        "الصور والفيديوهات",
                                        style: AppTextStyles.textStyle(
                                            weight: FontWeight.w500,
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
                                    weight: FontWeight.w500,
                                    title: "حالة الخدمة",
                                    onTap: () {

                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }
        else {
          return const Center(
            child: CustomLoading(),
          );
        }
      },
    );
  }
}