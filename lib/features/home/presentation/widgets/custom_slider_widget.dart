import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({Key? key}) : super(key: key);
  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}
class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  CarouselController controller = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: SizedBox(
          height: 188.h,
          width: 393.w,
          child: Column(
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                    clipBehavior: Clip.none,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
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
                      imageUrl: EndPoints.baseImageUrl +
                          context.read<HomeCubit>().sliderList[index].image!,
                        fit: BoxFit.fill,
                        height: 164.h,
                        width: 361.w,
                    ),
                  );
                },
              ),
              Gap(10.h),

              AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: context.read<HomeCubit>().sliderList.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5.w,
                  dotWidth: 10.w,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ],
          ),
        )
    );
  }
}