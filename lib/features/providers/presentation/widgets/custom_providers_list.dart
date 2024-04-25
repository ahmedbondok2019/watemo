import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/providers_cubit.dart';

class CustomProvidersList extends StatelessWidget {
  const CustomProvidersList({super.key});

  @override
  Widget build(BuildContext context) {
    ProvidersCubit providersCubit =
    BlocProvider.of<ProvidersCubit>(context);
    return BlocBuilder<ProvidersCubit, ProvidersState>(
        builder: (context, state) {
      return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: providersCubit.providersList.length,
      itemBuilder: (context, i) {
        final provider = providersCubit.providersList[i];
        return GestureDetector(
          onTap: () {
            providersCubit.changeProvider(provider.id);
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            width: 363.h,
            height: 108.w,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: providersCubit.provider != null &&
                    providersCubit.provider == provider.id
                    ? Border.all(color: AppColors.primary)
                    : null,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.c121212.withOpacity(0.08),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: const Offset(4, 4))
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
                        borderRadius: BorderRadius.circular(4.r),
                        child: CustomNetworkImage(
                          imageUrl: EndPoints.baseImageUrl + provider.image,
                          fit: BoxFit.cover,
                          width: 84.w,
                          height: 95.h,
                        ),
                      ),
                      Gap(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 247.w,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  provider.name,
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w500,
                                      color: AppColors.c090909,
                                      size: 14),
                                ),
                                Text(
                                  "${provider.price} ريال ",
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w500,
                                      color: AppColors.primary,
                                      size: 14),
                                ),
                              ],
                            ),
                          ),
                          Gap(10.h),
                          Row(
                            children: provider.lang
                                .map(
                                  (lang) => Text(
                                "$lang , ",
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w400,
                                    color: AppColors.c878787,
                                    size: 12),
                              ),
                            )
                                .toList(),
                          ),
                          Gap(5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20.h,
                                margin: EdgeInsets.symmetric(vertical: 5.w),
                                alignment: Alignment.center,
                                child: provider.rate < 1
                                    ? ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: SvgPicture.asset(
                                          ImageConstants.star,
                                          width: 20.w,
                                          height: 20.h,
                                          color: AppColors.c090909
                                              .withOpacity(0.3),
                                        ));
                                  },
                                )
                                    : ListView.builder(
                                  itemCount: provider.rate,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w),
                                      child: SvgPicture.asset(
                                        ImageConstants.star,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Gap(5.w),
                              Text(
                                "${provider.rate}.0",
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w500,
                                    color: AppColors.c090909,
                                    size: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        );
      },
    );});
  }
}