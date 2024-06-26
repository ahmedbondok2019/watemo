import 'package:shimmer/shimmer.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: SizedBox(
          height: 188.h,
          width: 393.w,
          child: context.read<HomeCubit>().sliderList.isNotEmpty
              ? Column(
                  children: [
                    CarouselSlider.builder(
                      carouselController: context.read<HomeCubit>().controller,
                      options: CarouselOptions(
                          clipBehavior: Clip.none,
                          onPageChanged: (index, reason) {
                            context.read<HomeCubit>().onPageChanged(index);
                          },
                          height: 164.h,
                          autoPlay: true,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true),
                      itemCount: context.read<HomeCubit>().sliderList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          height: 164.h,
                          width: 361.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.cE2E2E2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomNetworkImage(
                            imageUrl: context
                                .read<HomeCubit>()
                                .sliderList[index]
                                .image!,
                            fit: BoxFit.fill,
                            height: 164.h,
                            width: 361.w,
                          ),
                        );
                      },
                    ),
                    Gap(10.h),
                    AnimatedSmoothIndicator(
                      activeIndex: context.read<HomeCubit>().currentIndex,
                      count: context.read<HomeCubit>().sliderList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 5.w,
                        dotWidth: 10.w,
                        activeDotColor: AppColors.primary,
                      ),
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child: Container(
                    height: 164.h,
                    width: 361.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.cE2E2E2),
                      borderRadius: BorderRadius.circular(8.r),
                      image: const DecorationImage(
                          image: AssetImage(ImageConstants.placeholder),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}