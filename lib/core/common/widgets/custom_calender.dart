import 'dart:developer';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../src/app_export.dart';
import '../general_cubit/calendar/calendar_cubit.dart';
import '../general_cubit/calendar/calendar_state.dart';

class CustomCalenderWidget extends StatelessWidget {
  final bool isFullPicker;
  final bool isSignUp;
  final DateTime? initDate;
  final Function? onConfirm;

  const CustomCalenderWidget({
    super.key,
    this.isSignUp = false,
    this.isFullPicker = false,
    this.initDate,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    CalendarCubit calendarCubit = BlocProvider.of<CalendarCubit>(context);
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return AlertDialog(
          content: SizedBox(
            height: isFullPicker ? 345.h : 305.h,
            width: 0.9.sw,
            child: Column(
              children: [
                SizedBox(
                  height: 265.h,
                  child: SfDateRangePicker(
                          view: DateRangePickerView.month,
                          backgroundColor: AppColors.transparent,
                          selectionMode: DateRangePickerSelectionMode.single,
                          showNavigationArrow: true,
                          enablePastDates: isFullPicker ? false : true,
                          initialSelectedDate:
                              isSignUp ? initDate : initDate ?? DateTime.now(),
                          initialDisplayDate: initDate ?? DateTime.now(),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            dayFormat: 'EEE',
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                              textStyle: AppTextStyles.textStyle(
                                weight: FontWeight.w400,
                                size: 10,
                                color: AppColors.c3C3C43.withOpacity(0.7),
                              ),
                            ),
                          ),
                          headerStyle: DateRangePickerHeaderStyle(
                            textAlign: TextAlign.start,
                            backgroundColor: AppColors.transparent,
                            textStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.black,
                            ),
                          ),
                          yearCellStyle: DateRangePickerYearCellStyle(
                            textStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.black,
                            ),
                            todayTextStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.primary,
                            ),
                            leadingDatesTextStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.black,
                            ),
                            disabledDatesTextStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.black,
                            ),
                            cellDecoration: const BoxDecoration(),
                            todayCellDecoration: const BoxDecoration(),
                            disabledDatesDecoration: const BoxDecoration(),
                            leadingDatesDecoration: const BoxDecoration(),
                          ),
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.black,
                            ),
                            todayTextStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.primary,
                            ),
                            disabledDatesTextStyle: AppTextStyles.textStyle(
                              weight: FontWeight.w400,
                              size: 17,
                              color: AppColors.c3C3C43.withOpacity(0.3),
                            ),
                            todayCellDecoration: const BoxDecoration(),
                          ),
                          selectionTextStyle: AppTextStyles.textStyle(
                            weight: FontWeight.w600,
                            size: 17,
                            color: AppColors.white,
                          ),
                          onSelectionChanged: (val) {
                             calendarCubit.changeBirthDate(val.value);
                          },
                        ),
                ),

            CustomButtonInternet(
              height: 48,
              width: 361,
              horizontal: 0,
              title: "حفظ",
              onTap: () {
                CalendarCubit.get(context).confirmBirthDate();

                log('changeBirthDate ========>>>>>${calendarCubit.birthDate}');
                Navigator.pop(context);
              },
            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
