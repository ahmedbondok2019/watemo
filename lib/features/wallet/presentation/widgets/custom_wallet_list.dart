import '../../../../core/src/app_export.dart';
import '../../data/models/transactions_model.dart';

class CustomWalletList extends StatelessWidget {
  final List<TransactionsModel> transactionsList;
  const CustomWalletList({super.key,required this.transactionsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: transactionsList.length,
      itemBuilder: (context, i) {
        final transaction = transactionsList[i];
        return Column(
          children: [
            Container(
              height: 64.h,
              width: 363.w,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: transaction.isPlus == 0
                                  ? AppColors.c392F09
                                  : AppColors.primary
                          ),
                          child: SvgPicture.asset(
                            transaction.isPlus == 0
                                ? ImageConstants.walletDown
                                : ImageConstants.walletUp,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                        Gap(5.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.title ?? "",
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w600,
                                  color: AppColors.c090909,
                                  size: 16),
                            ),
                            Gap(5.h),
                            Text(
                              transaction.description ?? "",
                              textDirection: TextDirection.ltr,
                              style: AppTextStyles.textStyle(
                                  weight: FontWeight.w400,
                                  color: AppColors.c090909,
                                  size: 12),
                            ),
                          ],
                        ),
                      ]),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        transaction.date ?? "",
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w500,
                            color: AppColors.c090909,
                            size: 14),
                      ),
                      Gap(5.h),
                      Text(
                        transaction.percentage ?? "",
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w400,
                            color: AppColors.c2CB67D,
                            size: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: AppColors.cE2E2E2),
          ],
        );
      },
    );
  }
}