import '../../../../core/common/widgets/payment_type.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/checkout_cubit.dart';

class SelectPaymentType extends StatelessWidget {
  const SelectPaymentType({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = BlocProvider.of<CheckoutCubit>(context, listen: false);
    return BlocBuilder<CheckoutCubit, CheckoutState>(builder: (context, state) {
        return Column(
          children: [
            PaymentType(
              image: ImageConstants.mada,
              title: "meda".tr(context),
              borderColor: checkoutCubit.paymentType == 0
                  ? AppColors.primary
                  : AppColors.cECECEC,
              value: checkoutCubit.paymentType,
              groupValue: 0,
              onTap: () {
                checkoutCubit.changePaymentType(0);
              },
            ),
            PaymentType(
              image: ImageConstants.visa,
              title: "visa".tr(context),
              borderColor: checkoutCubit.paymentType == 1
                  ? AppColors.primary
                  : AppColors.cECECEC,
              value: checkoutCubit.paymentType,
              groupValue: 1,
              onTap: () {
                checkoutCubit.changePaymentType(1);
              },
            ),
            PaymentType(
              image: ImageConstants.wallet,
              title: "wallet".tr(context),
              borderColor: checkoutCubit.paymentType == 3
                  ? AppColors.primary
                  : AppColors.cECECEC,
              value: checkoutCubit.paymentType,
              groupValue: 3,
              onTap: () {
                checkoutCubit.changePaymentType(3);
              },
            ),
          ],
        );
    });
  }
}