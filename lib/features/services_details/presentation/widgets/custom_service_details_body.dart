import 'dart:ui';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../auth/presentation/widgets/custom_drop_down_nat_res.dart';
import '../../../checkout/data/models/create_order/create_order_req_model.dart';
import '../../../services/cubit/services_cubit.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/service_details_cubit.dart';

class CustomServiceDetailsBody extends StatelessWidget {
  final ServicesModel service;
  const CustomServiceDetailsBody({super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    ServiceDetailsCubit serviceDetailsCubit =
        BlocProvider.of<ServiceDetailsCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// logo && name
        Gap(20.h),
        Row(
          children: [
            Image.asset(
              ImageConstants.logoApp,
              width: 24.w,
              height: 24.h,
            ),
            Gap(8.w),
            Text(
              "تفاصيل الطلب",
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w500,
                  color: AppColors.c090909,
                  size: 16),
            ),
          ],
        ),
        Gap(15.h),
        Text(
          "العمره بيابه عن “اسم الشخص”",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),
        InputFormField(
          hint: "الاسم هنا",
          fillColor: AppColors.cFBFBFB,
          controller: serviceDetailsCubit.nameController,
        ),

        ///relative relation
        Gap(25.h),
        Text(
          "صلة القرابة",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),

        CustomDropDownNat(
          width: double.infinity,
          list: serviceDetailsCubit.relations,
          selectedItem: serviceDetailsCubit.relation,
          onChanged: serviceDetailsCubit.changeRelations,
          label: "اختر صلة القرابة",
        ),

        /// date
        Gap(25.h),
        Text(
          "تحديد التاريخ",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),

        BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  await showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          content: SizedBox(
                            height: 440.h,
                            child: Column(
                              children: [
                                SfDateRangePicker(
                                  view: DateRangePickerView.month,
                                  selectionMode: DateRangePickerSelectionMode.single,
                                  showNavigationArrow: true,
                                  showTodayButton: false,
                                  showActionButtons: false,
                                  toggleDaySelection: true,
                                  viewSpacing: 0,
                                  selectionColor: AppColors.primary,
                                  selectionRadius: 0,
                                  monthViewSettings: DateRangePickerMonthViewSettings(
                                      dayFormat: "E",
                                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                        textStyle: AppTextStyles.textStyle(
                                            weight: FontWeight.w400,
                                            size: 10,
                                            color: AppColors.black),
                                      )
                                  ),
                                  headerStyle: DateRangePickerHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.black),
                                  ),
                                  yearCellStyle: DateRangePickerYearCellStyle(
                                    textStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.black),
                                    todayTextStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.primary),
                                    leadingDatesTextStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.black),
                                    disabledDatesTextStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.black),
                                    cellDecoration: const BoxDecoration(),
                                    todayCellDecoration: const BoxDecoration(),
                                    disabledDatesDecoration: const BoxDecoration(),
                                    leadingDatesDecoration: const BoxDecoration(),
                                  ),
                                  selectionShape: DateRangePickerSelectionShape.circle,
                                  navigationDirection: DateRangePickerNavigationDirection.horizontal,
                                  monthCellStyle: DateRangePickerMonthCellStyle(
                                    textStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.black),
                                    todayTextStyle: AppTextStyles.textStyle(
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: AppColors.primary),
                                    cellDecoration: const BoxDecoration(),
                                    todayCellDecoration: const BoxDecoration(),
                                    disabledDatesDecoration: const BoxDecoration(),
                                    leadingDatesDecoration: const BoxDecoration(),
                                  ),
                                  selectionTextStyle: AppTextStyles.textStyle(
                                      weight: FontWeight.w400,
                                      size: 14,
                                      color: AppColors.primary),
                                  onSelectionChanged: (val){
                                    serviceDetailsCubit.changeDate(
                                        val.value.toString().substring(0,10)
                                    );
                                  },
                                ),

                                /// button
                                CustomButtonInternet(
                                  height: 48,
                                  width: 68,
                                  horizontal: 0,
                                  vertical: 0,
                                  title: "حفظ",
                                  onTap: ()=>Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 362.w,
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: AppColors.cFBFBFB,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.cC7C7C7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        serviceDetailsCubit.selectDate ?? "اختر التاريخ",
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w400,
                            color: AppColors.c090909,
                            size: 14),
                      ),
                      SvgPicture.asset(ImageConstants.dropArrow,
                          width: 15.w, height: 7.h)
                    ],
                  ),
                ),
              );
            }),

        /// notes
        Gap(25.h),
        Text(
          "اضافة ملاحظات",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),
        InputFormField(
          maxLines: 5,
          maxLength: 500,
          inputFormatters: [
            LengthLimitingTextInputFormatter(500),
          ],
          fillColor: AppColors.cFBFBFB,
          controller: serviceDetailsCubit.noteController,
        ),

        /// total service
        Gap(25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "سعر الخدمة",
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w500,
                  color: AppColors.c090909,
                  size: 16),
            ),
            Row(
              children: [
                Text(
                  "${service.price}",
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w700,
                      color: AppColors.c2CB67D,
                      size: 13),
                ),
                Gap(5.w),
                Text(
                  "ريال",
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w500,
                      color: AppColors.c9B9B9B,
                      size: 13),
                ),
              ],
            ),
          ],
        ),
        Gap(8.h),

        /// button
        CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "التالي",
          onTap: () {
              if (serviceDetailsCubit.nameController.text.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "يجب كتابة اسم الشخص",
                    type: AlertType.warning);
              }
              else if (serviceDetailsCubit.relation == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار صلة القرابة",
                    type: AlertType.warning);
              }
              else if (serviceDetailsCubit.selectDate == null) {
                CustomMessage.showMessage(context,
                    message: "يجب اختيار تاريخ العمره",
                    type: AlertType.warning);
              }
              else {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: BlocProvider<ServicesCubit>(
                        create: (context) =>
                        getIt<ServicesCubit>()..getSpokenLanguages(),
                        child: CustomBottomSheetProvider(
                            service: service,
                            orderDetails: CreateOrderReqModel(
                              serviceId: service.id.toString(),
                              onBehalfOf: serviceDetailsCubit.nameController.text.trim(),
                              userRelation: serviceDetailsCubit.relation!.id.toString(),
                              notes: serviceDetailsCubit.noteController.text.trim(),
                              requiredDate: serviceDetailsCubit.selectDate,
                            )
                        ),
                      ),
                    ));
              }
          },
        ),
      ],
    );
  }
}
