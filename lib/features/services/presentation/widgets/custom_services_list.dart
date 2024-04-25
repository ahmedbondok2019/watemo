import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/services/services_model.dart';

class CustomServicesList extends StatelessWidget {
  final List<ServicesModel> servicesList;
  const CustomServicesList({super.key,
    required this.servicesList,
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
          padding: EdgeInsets.symmetric(horizontal: 8.r),
          width: 361.h,
          height: 92.w,
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
                      borderRadius: BorderRadius.circular(8.0.r),
                      child: CustomNetworkImage(
                        imageUrl: EndPoints.baseServicesUrl + service.image!,
                        fit: BoxFit.cover,
                        width: 72.w,
                        height: 76.h,
                      ),
                    ),
                    Gap(5.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.title ?? "",
                          style: AppTextStyles.textStyle(
                              weight: FontWeight.w500,
                              color: AppColors.c090909,
                              size: 16),
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
                                  // color: AppColors.c2CB67D,
                                  size: 16),
                            ),
                            Gap(5.w),
                            Text(
                              "ريال ",
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w400,
                                  color: AppColors.c090909,
                                  // color: AppColors.c9A9A9A,
                                  size: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),

              CustomButtonInternet(
                height: 34,
                width: 103,
                horizontal: 0,
                title: "اطلب الان",
                onTap: ()=>Navigator.pushNamed(
                    context,
                    AppRoutes.serviceDetails,
                    arguments: service
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}