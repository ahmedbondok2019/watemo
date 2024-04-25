import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/offers_cubit.dart';

class CustomOffersList extends StatelessWidget {
  const CustomOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: OffersCubit.get(context).offersList.length,
      itemBuilder: (context, i) {
        final offer = OffersCubit.get(context).offersList[i];
        return Container(
          height: 164.h,
          width: 361.w,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cE2E2E2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: CustomNetworkImage(
            imageUrl: EndPoints.baseImageUrl +
                offer.image!,
            fit: BoxFit.fill,
            height: 164.h,
            width: 361.w,
          ),
        );
      },
    );
  }
}