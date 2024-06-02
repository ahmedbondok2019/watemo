import '../../../../core/src/app_export.dart';
import '../../data/models/order_step/step_model.dart';

class CustomStepsList extends StatelessWidget {
  final List<StepModel> stepsList;

  const CustomStepsList({
    super.key,
    required this.stepsList,
  });

  @override
  Widget build(BuildContext context) {
    return stepsList.isEmpty
        ? const SizedBox()
        : Center(
            child: Container(
              width: 375.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.cF5F5F5,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: ListView.builder(
                  itemCount: stepsList.length,
                  scrollDirection: Axis.horizontal,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              index == 0
                                  ? SizedBox(width: 15.w)
                                  : SizedBox(
                                      width: 15.w,
                                      child: Text(
                                        "---",
                                        style: AppTextStyles.textStyle(
                                            weight: FontWeight.w600,
                                            color: stepsList[index - 1].status!
                                                ? AppColors.c58A047
                                                : AppColors.c090909,
                                            size: 14),
                                      ),
                                    ),
                              SvgPicture.asset(
                                stepsList[index].status!
                                    ? ImageConstants.doneStep
                                    : ImageConstants.circle,
                                width: 24.w,
                                height: 24.h,
                              ),
                              index + 1 == stepsList.length
                                  ? const SizedBox()
                                  : SizedBox(
                                width: 114.w,
                                child: Text(
                                  "-----------------------",
                                  overflow: TextOverflow.clip,
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w600,
                                      color: stepsList[index].status!
                                          ? AppColors.c58A047
                                          : AppColors.c090909,
                                      size: 14),
                                ),
                              ),
                            ],
                          ),
                          Gap(10.h),
                          SizedBox(
                            width: 140.w,
                            child: Text(
                              stepsList[index].text ?? "",
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w600,
                                  color: stepsList[index].status!
                                      ? AppColors.c58A047
                                      : AppColors.c090909,
                                  size: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
  }
}
