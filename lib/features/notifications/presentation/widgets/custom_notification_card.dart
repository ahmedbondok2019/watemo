import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';

class CustomNotificationCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String date;
  final bool isRead;

  const CustomNotificationCard({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.date,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 363.w,
        height: 129.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isRead ? AppColors.white : AppColors.cF6F4EC,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: CustomNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fill,
                        width: 32.w, height: 32.h
                    ),
                ),
                Gap(10.w),
                SizedBox(
                    width: 270.w,
                    child: Text(
                  title,maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w600,
                      color: AppColors.c090909,
                      size: 14),
                ))
              ],
            ),
            Gap(5.w),
            Row(
              children: [
                Gap(5.w),
                Container(
                  width: 4.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: AppColors.cDDDEE1,
                      borderRadius: BorderRadius.circular(2.r)),
                ),
                Gap(5.w),
                SizedBox(
                  width: 327.w,height: 40.h,
                  child: Text(
                    subTitle,
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                ),
              ],
            ),
            Gap(10.w),
            Text(
              date,
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w400,
                  color: AppColors.c9A9A9A, size: 12),
            ),
          ],
        ),
      ),
    );
  }
}
