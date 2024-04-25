import '../../../../core/src/app_export.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/select_wallet_type.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundComponent(
        opacity: 0.2,
        child: BlocBuilder<WalletCubit, WalletState>(
          builder: (context, state) {
            return Column(
              children: [
                const CustomAppBar(
                  title: "إضافة رصيد",
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20.h),
                            Text(
                              "اختر بوابة الدفع",
                              style: AppTextStyles.textStyle(
                                  size: 16, weight: FontWeight.w600,
                                  color: AppColors.c090909),
                            ),

                            const SelectWalletType(),

                            Gap(20.h),
                            Text(
                              "بيانات بطاقة الدفع",
                              style: AppTextStyles.textStyle(
                                  size: 16, weight: FontWeight.w600,
                                  color: AppColors.c090909),
                            ),
                            Gap(20.h),
                            Text(
                              "رقم البطاقة",
                              style: AppTextStyles.textStyle(
                                  size: 14, weight: FontWeight.w600,
                                  color: AppColors.c090909),
                            ),
                            Gap(10.h),
                            InputFormField(
                              // controller: authCubit.confirmPasswordController,
                              validator: (value) {
                                return null;
                              },
                              fillColor: AppColors.white,
                              // hint: "***********",
                              suffixIcon: Image.asset(ImageConstants.mastercard,
                                width: 25.w,height: 16.h,),
                            ),
                            Gap(30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     "رقم البطاقة",
                                     style: AppTextStyles.textStyle(
                                         size: 14, weight: FontWeight.w600,
                                         color: AppColors.c090909),
                                   ),
                                   Gap(5.h),
                                   InputFormField(
                                     width: 173.w,
                                     // controller: authCubit.confirmPasswordController,
                                     validator: (value) {
                                       return null;
                                     },
                                     fillColor: AppColors.white,
                                   ),
                                 ],
                               ),

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     "رقم البطاقة",
                                     style: AppTextStyles.textStyle(
                                         size: 14, weight: FontWeight.w600,
                                         color: AppColors.c090909),
                                   ),
                                   Gap(5.h),
                                   InputFormField(
                                     width: 173.w,
                                     // controller: authCubit.confirmPasswordController,
                                     validator: (value) {
                                       return null;
                                     },
                                     fillColor: AppColors.white,
                                   ),
                                 ],
                               ),
                              ],
                            ),

                            Gap(20.h),
                            CustomButtonInternet(
                              height: 48,
                              width: 361,
                              horizontal: 0,
                              title: "التالي",
                              onTap: () {},
                              // onTap: () => Navigator.pushNamed(context, AppRoutes.addWallet),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
