import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';
import '../../../auth/presentation/widgets/custom_drop_down_nat_res.dart';
import '../../cubit/services_cubit.dart';
import '../../data/models/services/services_model.dart';
import 'custom_bottom_sheet_add_service.dart';

class CustomServiceDetailsBody extends StatelessWidget {
  final TitleIdListModel titleId;
  final ServicesModel? service;

  const CustomServiceDetailsBody({
    super.key,
    required this.titleId,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
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
              "order_details".tr(context),
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w500, color: AppColors.c090909, size: 16),
            ),
          ],
        ),
        Gap(15.h),
        Text(
          "${titleId.title} ${"person_name".tr(context)}",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),
        InputFormField(
          hint: "hint_name".tr(context),
          fillColor: AppColors.cFBFBFB,
          controller: context.read<ServicesCubit>().nameController,
        ),

        ///relative relation
        Gap(25.h),
        Text(
          "relation".tr(context),
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 14),
        ),
        Gap(10.h),
        BlocBuilder<ServicesCubit, ServicesState>(builder: (_, state) {
          return CustomDropDownNat(
            width: double.infinity,
            list: context.read<ServicesCubit>().relations,
            bgColor: AppColors.cFBFBFB,
            selectedItem: context.read<ServicesCubit>().relation,
            onChanged: context.read<ServicesCubit>().changeRelations,
            label: "select_relation".tr(context),
            isTrans: false,
          );
        }),

        /// notes
        Gap(25.h),
        Text(
          "add_notes".tr(context),
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
          controller: context.read<ServicesCubit>().noteController,
        ),
        Gap(25.h),

        titleId.id == 3
            ? BlocBuilder<ServicesCubit, ServicesState>(builder: (_, state) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  width: 365.w,
                  height: 65.h,
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
                    children: [
                      InkWell(
                        onTap: context.read<ServicesCubit>().incrementCounter,
                        child: SvgPicture.asset(
                          ImageConstants.plusIcon,
                          width: 32.w,
                          height: 32.h,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        context.read<ServicesCubit>().counter.toString(),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.primary,
                            size: 14),
                      ),
                      InkWell(
                        onTap: context.read<ServicesCubit>().decrementCounter,
                        child: SvgPicture.asset(
                          ImageConstants.minusIcon,
                          width: 32.w,
                          height: 32.h,
                          color: context.read<ServicesCubit>().counter == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              })
            : GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      builder: (_) => BlocBuilder<ServicesCubit, ServicesState>(
                              builder: (_, state) {
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
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Gap(15.h),
                                      Container(
                                        width: 60.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.cA7A7A7,
                                          borderRadius:
                                              BorderRadius.circular(2.5.r),
                                        ),
                                      ),
                                      Gap(20.h),
                                      CustomBottomSheetListService(
                                        servicesList: context
                                            .read<ServicesCubit>()
                                            .servicesList,
                                        selectServicesList: context
                                            .read<ServicesCubit>()
                                            .selectServicesList,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 10.w,
                                    top: 24.h,
                                    child: InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        ImageConstants.close,
                                        width: 16.w,
                                        height: 16.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                },
                child: Container(
                  width: 361.w,
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.cFBFBFB,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.cE3E3E3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "additional_services".tr(context),
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w600,
                            color: AppColors.c090909,
                            size: 16),
                      ),
                      SvgPicture.asset(
                        ImageConstants.arrowBackLeft,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
