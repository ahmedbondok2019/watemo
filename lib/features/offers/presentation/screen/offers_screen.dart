import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/offers_cubit.dart';
import '../widgets/custom_offers_list.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: BlocBuilder<OffersCubit, OffersState>(
          builder: (context, state) {
            if (state is OffersLoading) {
              return const Center(
                child: CustomLoading(),
              );
            }
            else if (state is OffersSuccess) {
              return Column(
                children: [
                  CustomAppBar(
                    title: "العروض",
                    titleSize: 16,
                    leading: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 48.w,height: 48.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomNetworkImage(
                          imageUrl: EndPoints.baseImageUrl +
                              context.read<HomeCubit>()
                                  .user!.image!,
                          fit: BoxFit.fill,
                          height: 164.h,
                          width: 361.w,
                        ),
                      ),
                    ),
                    actions: const [NotificationIcon()],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.r,
                              vertical: 10.r,
                          ),
                          child: const CustomOffersList(),
                      ),
                    ),
                  ),
                ],
              );
            }
            else if (state is OffersError) {
              return Center(
                child: Text(
                  NetworkExceptions.getErrorMessage(state.networkExceptions),
                ),
              );
            }
            else {
              return const Center(
                child: CustomLoading(),
              );
            }
          },
        ),
      ),
    );
  }
}