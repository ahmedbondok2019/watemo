import '../../../../core/src/app_export.dart';
import '../../data/models/steps/steps_model.dart';

class CustomBottomSheetTracking extends StatelessWidget {
  final List<StepsModel> steps;
  const CustomBottomSheetTracking({
    super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.r,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(55.h),
                Text(
                  "service_status".tr(context),
                  style: AppTextStyles.textStyle(
                    color: AppColors.c090909,
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(15.h),

                steps.isEmpty
                    ? const SizedBox()
                    : ListView.builder(
                    itemCount: steps.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 10.h),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    steps[index].time ?? "",
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w500,
                                        color: AppColors.c7E7E7E,
                                        size: 12),
                                  ),
                                  Gap(5.h),
                                  Text(
                                    steps[index].date ?? "",
                                    style: AppTextStyles.textStyle(
                                        weight: FontWeight.w600,
                                        color: AppColors.c090909,
                                        size: 12),
                                  ),
                                ],
                              ),
                              Gap(5.w),

                              Column(
                                children: [
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: steps[index].status!
                                            ? AppColors.c47C650
                                            : AppColors.cF14D48),
                                  ),
                                  index + 1 == steps.length
                                      ? const SizedBox()
                                      : Image.asset(
                                    steps[index].status!
                                        ? ImageConstants
                                        .lineGreen
                                        : ImageConstants
                                        .lineRed,
                                    height: 88.h,
                                  ),
                                ],
                              ),

                              Gap(5.w),
                              SizedBox(
                                width: 265.w,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      steps[index].text ?? "",
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w600,
                                          color: steps[index].status!
                                              ? AppColors.c58A047
                                              : AppColors.c090909,
                                          size: 16),
                                    ),
                                    Gap(5.h),
                                    Text(
                                      steps[index].description ?? "",
                                      maxLines: 3,
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w500,
                                          color: steps[index].status!
                                              ? AppColors.c58A047
                                              : AppColors.c090909,
                                          size: 14),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),

          Container(
              height: 25,
              alignment: Alignment.bottomCenter,
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(25.w),
                  Container(
                    width: 60.w,
                    height: 5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.cA7A7A7,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      ImageConstants.close,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                ],
              ),),
        ],
      ),
    );
  }
}