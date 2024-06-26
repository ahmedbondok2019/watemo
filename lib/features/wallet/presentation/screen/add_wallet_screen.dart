import '../../../../core/common/widgets/custom_app_drawer.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../cubit/wallet_cubit.dart';
import '../widgets/select_wallet_type.dart';

class AddWalletScreen extends StatelessWidget {
  AddWalletScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppConstants.userType == AppConstants.user ||
          AppConstants.userType == AppConstants.company
          ? null
          : _scaffoldKey,
      drawer: AppConstants.userType == AppConstants.user ||
          AppConstants.userType == AppConstants.company
          ? null
          : const CustomAppDrawer(),
      body: BackgroundComponent(
        opacity: 0.2,
        child: BlocBuilder<WalletCubit, WalletState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBar(
                  title: "add_money".tr(context),
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

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20.h),
                            Text(
                              "select_payment_method".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 16, weight: FontWeight.w600,
                                  color: AppColors.c090909),
                            ),

                            const SelectWalletType(),

                            Gap(20.h),
                            Text(
                              "total".tr(context),
                              style: AppTextStyles.textStyle(
                                  size: 14, weight: FontWeight.w600,
                                  color: AppColors.c090909),
                            ),
                            Gap(10.h),
                            InputFormField(
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "total".tr(context);
                                }
                                return null;
                              },
                              isNumber: true,
                              fillColor: AppColors.white,
                              controller: context.read<WalletCubit>().totalController,
                            ),


                            Gap(20.h),

                            addButtonWidget()
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
  //<WalletCubit, WalletState
  BlocConsumer<WalletCubit, WalletState> addButtonWidget() {
    return BlocConsumer<WalletCubit, WalletState>(listener: (context, state) {
      if (state is AddAmountToWalletFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is AddAmountToWalletSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mainLayer, (route) => false);
      }
    }, builder: (context, state) {
      if (state is AddAmountToWalletLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "next".tr(context),
          onTap: () {
           if (context.read<WalletCubit>().totalController.text.isEmpty) {
                CustomMessage.showMessage(context,
                    message: "total".tr(context),
                    type: AlertType.warning);
              }
              else {
                context.read<WalletCubit>().addAmountToWallet();
              }
          },
        );
      }
    });
  }
}
