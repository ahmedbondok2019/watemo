import 'package:completed/features/checkout/presentation/widgets/select_payment_type.dart';
import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/common/widgets/delete_service_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/utils.dart';
import '../../../home/data/models/hajj_model.dart';
import '../../../services/data/models/services/services_model.dart';

class CustomCheckoutDetailsBody extends StatefulWidget {
  final ServicesModel? service;
  final HajjModel? hajj;
  final List<ServicesModel> selectServices;
  const CustomCheckoutDetailsBody({super.key,
    required this.service,
    required this.selectServices,
    required this.hajj,
  });
  @override
  State<CustomCheckoutDetailsBody> createState() => _CustomCheckoutDetailsBodyState();
}
class _CustomCheckoutDetailsBodyState extends State<CustomCheckoutDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// details
        Gap(20.h),
        Text(
          "order_details".tr(context),
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        Gap(15.h),

        Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          width: 365.w,
          height: 92.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, 0))
              ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CustomNetworkImage(
                    imageUrl: widget.hajj != null
                        ? widget.hajj!.image!
                        : widget.service!.image!,
                    fit: BoxFit.cover,
                    width: 65.w,
                    height: 76.h,
                  ),
                ),
                Gap(5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 185.w,
                      child: Text(
                        widget.hajj != null
                            ? widget.hajj!.title ?? ""
                            : widget.service!.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w500,
                            color: AppColors.c090909,
                            size: 16),
                      ),
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Text(
                          widget.hajj != null
                              ? widget.hajj!.price.toString()
                              : widget.service!.price.toString(),
                          textDirection: TextDirection.ltr,
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w700,
                              color: AppColors.c090909,
                              size: 16),
                        ),
                        Gap(5.w),
                        Text("rial".tr(context),
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              color: AppColors.c090909,
                              size: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),

        ListView.builder(
            itemCount: widget.selectServices.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                width: 365.w,
                height: 92.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.08),
                          spreadRadius: 0,
                          blurRadius: 16,
                          offset: const Offset(0, 0))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CustomNetworkImage(
                              imageUrl: widget.selectServices[index].image!,
                              fit: BoxFit.cover,
                              width: 65.w,
                              height: 76.h,
                            ),
                          ),
                          Gap(5.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 185.w,
                                child: Text(
                                  widget.selectServices[index].title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w500,
                                      color: AppColors.c090909,
                                      size: 16),
                                ),
                              ),
                              Gap(10.h),
                              Row(
                                children: [
                                  Text(
                                    widget.selectServices[index].price.toString(),
                                    textDirection: TextDirection.ltr,
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w700,
                                        color: AppColors.c090909,
                                        size: 16),
                                  ),
                                  Gap(5.w),
                                  Text(
                                    "rial".tr(context),
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        color: AppColors.c090909,
                                        size: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ]),

                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            showAnimatedDialog(context,
                                DeleteServiceDialog(
                                  title: widget.selectServices[index].title.toString(),
                                  onTapConfirm: () {
                                    Navigator.pop(context);
                                    widget.selectServices.removeAt(index);
                                    setState(() {});
                                  },
                                ),
                                dismissible: false, isFlip: true);
                          },
                          child: SvgPicture.asset(
                            ImageConstants.deleteIcon,
                            width: 24.w,
                            height: 24.w,
                          ),
                        ),

                        Gap(10.w),
                      ],
                    ),
                  ],
                ),
              );
            }
        ),

        Gap(10.h),
        Container(
          width: 363.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: AppColors.cFFFCEF,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              Text(
                "price_order_details".tr(context),
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w600,
                    color: AppColors.c090909,
                    size: 14),
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "basic_service".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c636363,
                        size: 14),
                  ),
                  Row(
                    children: [
                      Text(Utils.calculateTotalService(widget.hajj,widget.service),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                      Gap(5.w),
                      Text("rial".tr(context),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                    ],
                  ),
                ],
              ),

              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "additional_services".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c636363,
                        size: 14),
                  ),
                  Row(
                    children: [
                      Text(Utils.calculateAddService(widget.selectServices),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                      Gap(5.w),
                      Text("rial".tr(context),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total".tr(context),
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w600,
                        color: AppColors.c090909,
                        size: 14),
                  ),

                  Row(
                    children: [
                      Text(Utils.calculateTotal(
                        selectServices: widget.selectServices,
                        hajj: widget.hajj,
                        service: widget.service,
                      ),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                      Gap(5.w),
                      Text("rial".tr(context),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.c636363,
                            size: 12),
                      ),
                    ],
                  ),
                ],
              ),

              Gap(10.h),
            ],
          ),
        ),
        Gap(20.h),
        Text(
          "payment_method".tr(context),
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        Gap(5.h),
        const SelectPaymentType(),

        Gap(100.h),
      ],
    );
  }
}