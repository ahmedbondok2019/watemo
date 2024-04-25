import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/custom_wallet_list.dart';

class AllWalletScreen extends StatelessWidget {
  const AllWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: Column(
          children: [
            const CustomAppBar(
              title: "المحفظة",
              titleSize: 16,
              leading: CustomBackButton(),
              actions: [NotificationIcon()],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.r,
                      vertical: 10.r,
                    ),
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.r,
                              vertical: 10.r,
                            ),
                            child: BlocBuilder<WalletCubit, WalletState>(
                              builder: (context, state) {
                                if (state is LastWalletLoading) {
                                  return const Center(
                                    child: CustomLoading(),
                                  );
                                }
                                else if (state is LastWalletSuccess) {
                                  return Column(
                                    children: [
                                      Gap(20.h),
                                      CustomWalletList(
                                        transactionsList: context.read<WalletCubit>().lastTransactionsList,
                                      ),
                                    ],
                                  );
                                }
                                else if (state is LastWalletFailed) {
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
                            )
                        ),
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
