import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/services/services_model.dart';

class CustomServicesList extends StatelessWidget {
  final List<ServicesModel> servicesList;
  final TitleIdListModel titleId;
  const CustomServicesList({super.key,
    required this.servicesList,
    required this.titleId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: servicesList.length,
      itemBuilder: (context, i) {
        final service = servicesList[i];
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CustomNetworkImage(
                        imageUrl: service.image!,
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
                            service.title ?? "",
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
                              service.price.toString(),
                              textDirection: TextDirection.ltr,
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w700,
                                  color: AppColors.c090909,
                                  size: 16),
                            ),
                            Gap(5.w),
                            Text(
                              "ريال ",
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

              CustomButtonInternet(
                height: 34,
                width: 90,
                horizontal: 0,
                title: "اطلب الان",
                size: 14,
                onTap: ()=>Navigator.pushNamed(
                    context, AppRoutes.serviceDetails,
                    arguments: [null, titleId, service]
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}