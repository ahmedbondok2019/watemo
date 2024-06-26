import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/common/widgets/custom_no_result.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/custom_wallet_list.dart';

class AllWalletScreen extends StatelessWidget {
  AllWalletScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            CustomAppBar(
              title: "wallet".tr(context),
              titleSize: 16,
              leading: const CustomBackButton(),
              actions: [
                AppConstants.userType == AppConstants.user ||
                    AppConstants.userType == AppConstants.company
                    ? const NotificationIcon()
                    : CustomDrawerIcon(
                  onTap: ()=> _scaffoldKey.currentState?.openDrawer(),
                ),
              ],
            ),


            BlocBuilder<WalletCubit, WalletState>(
              builder: (context, state) {
                if (state is LastWalletLoading) {
                  return const Expanded(
                    child: CustomLoading());
                }
                if (state is LastWalletSuccess) {
                  return Expanded(
                    child: context.read<WalletCubit>().lastTransactionsList.isEmpty
                        ? Center(child: CustomNoResult(
                        title: "no_wallet".tr(context)))
                        : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Gap(20.h),
                            CustomWalletList(
                              transactionsList: context.read<WalletCubit>().lastTransactionsList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return const Expanded(
                      child: CustomLoading());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
