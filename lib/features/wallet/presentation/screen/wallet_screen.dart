import 'package:intl/intl.dart';
import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_no_result.dart';
import '../../../../core/common/widgets/custom_profile_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/custom_wallet_list.dart';

class WalletScreen extends StatelessWidget {
  final bool isHome;

  WalletScreen({super.key, required this.isHome});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppConstants.userType == AppConstants.user ||
              AppConstants.userType == AppConstants.company
          ? null
          : const CustomAppDrawer(),
      floatingActionButton: CustomButtonInternet(
        height: 48,
        width: 361,
        horizontal: 0,
        vertical: isHome ? 120 : null,
        title: "إضافة رصيد",
        onTap: () => Navigator.pushNamed(context, AppRoutes.addWallet),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BackgroundComponent(
          opacity: 0.2,
          child: Column(
            children: [
              CustomAppBar(
                title: "المحفظة",
                titleSize: 16,
                leading: isHome
                    ? const CustomProfileImage()
                    : const CustomBackButton(),
                actions: [
                  AppConstants.userType == AppConstants.user ||
                          AppConstants.userType == AppConstants.company
                      ? const NotificationIcon()
                      : CustomDrawerIcon(
                          onTap: () => _scaffoldKey.currentState?.openDrawer(),
                        ),
                ],
              ),
              BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
                  if (state is WalletLoading) {
                    return const Expanded(
                        child: Center(
                      child: CustomLoading(),
                    ));
                  } else if (state is WalletSuccess) {
                    return Expanded(
                        child: Column(
                      children: [
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
                                        DateFormat('EEEE, d MMM, yyyy')
                                            .format(DateTime.now())
                                            .toString(),
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
                        Gap(20.h),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
                            child: CustomSeeAll(
                              title: "اخر العمليات",
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.lastWallet),
                            )),
                        Expanded(
                          child: context
                                  .read<WalletCubit>()
                                  .transactionsList
                                  .isEmpty
                              ? Column(
                                  children: [
                                    Gap(50.h),
                                    const CustomNoResult(
                                        title: "لم تقم باجراء اي عمليات مالية"),
                                  ],
                                )
                              : SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 10.h,
                                    ),
                                    child: CustomWalletList(
                                      transactionsList: context
                                          .read<WalletCubit>()
                                          .transactionsList,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ));
                  } else if (state is WalletFailed) {
                    return Center(
                      child: Text(
                        NetworkExceptions.getErrorMessage(
                            state.networkExceptions),
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(child: CustomLoading()),
                    );
                  }
                },
              ),
            ],
          )),
    );
  }
}
