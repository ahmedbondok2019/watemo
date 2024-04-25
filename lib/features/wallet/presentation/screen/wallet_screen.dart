import 'package:intl/intl.dart';

import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/custom_wallet_list.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomButtonInternet(
        height: 48,
        width: 361,
        horizontal: 0,
        title: "إضافة رصيد",
        onTap: () => Navigator.pushNamed(context, AppRoutes.addWallet),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BackgroundComponent(
        opacity: 0.2,
        child: BlocBuilder<WalletCubit, WalletState>(
          builder: (context, state) {
            if (state is WalletLoading) {
              return const Center(
                child: CustomLoading(),
              );
            } else if (state is WalletSuccess) {
              return Column(
                children: [
                  Column(
                    children: [
                      const CustomAppBar(
                        title: "المحفظة",
                        titleSize: 16,
                        leading: CustomBackButton(),
                        actions: [NotificationIcon()],
                      ),
                      Gap(20.h),
                      SizedBox(
                        width: 363.w,
                        height: 194.h,
                        child: Stack(
                          children: [
                            Positioned(
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Image.asset(
                                  ImageConstants.bG,
                                  fit: BoxFit.fill,
                                  width: 363.w,
                                  height: 156.h,
                                )),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Image.asset(
                                ImageConstants.gold,
                                fit: BoxFit.fill,
                                width: 132.w,
                                height: 194.h,
                              ),
                            ),
                            Positioned(
                                left: 25.w,
                                top: 80.h,
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()).toString(),
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w400,
                                          color: AppColors.white,
                                          size: 14),
                                    ),
                                    Gap(10.h),
                                    Text(
                                      "${context.read<WalletCubit>().total} ريال ",
                                      style: AppTextStyles.textStyle(
                                          weight: FontWeight.w700,
                                          color: AppColors.white,
                                          size: 25),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.r,
                            vertical: 10.r,
                          ),
                          child: Column(
                            children: [
                              Gap(20.h),
                              CustomSeeAll(
                                title: "اخر العمليات",
                                onTap: () => Navigator.pushNamed(context,
                                    AppRoutes.lastWallet),
                              ),

                              CustomWalletList(
                                transactionsList: context.read<WalletCubit>().transactionsList,
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            } else if (state is WalletFailed) {
              return Center(
                child: Text(
                  NetworkExceptions.getErrorMessage(state.networkExceptions),
                ),
              );
            } else {
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
