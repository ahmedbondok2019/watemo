import '../../../../core/common/widgets/payment_type.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';

class SelectWalletType extends StatelessWidget {
  const SelectWalletType({super.key});

  @override
  Widget build(BuildContext context) {
    WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context, listen: false);
    return BlocBuilder<WalletCubit,
        WalletState>(builder: (context, state) {
        return Column(
          children: [
            PaymentType(
              image: ImageConstants.mada,
              title: "بطاقة مدي البنكية",
              borderColor: walletCubit.paymentType == 0
                  ? AppColors.primary
                  : AppColors.cECECEC,
              value: walletCubit.paymentType,
              groupValue: 0,
              onTap: () {
                walletCubit.changePaymentType(0);
              },
            ),
            PaymentType(
              image: ImageConstants.visa,
              title: "فيزا او ماستر كارد",
              borderColor: walletCubit.paymentType == 1
                  ? AppColors.primary
                  : AppColors.cECECEC,
              value: walletCubit.paymentType,
              groupValue: 1,
              onTap: () {
                walletCubit.changePaymentType(1);
              },
            ),
          ],
        );
    });
  }
}