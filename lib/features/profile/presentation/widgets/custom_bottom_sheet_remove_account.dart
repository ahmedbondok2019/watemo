import '../../../../core/common/widgets/animated_custom_dialog.dart';
import '../../../../core/common/widgets/my_dialog.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/profile_cubit.dart';

class CustomBottomSheetRemoveAccount extends StatelessWidget {
  const CustomBottomSheetRemoveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return Container(
        width: 393.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(10.w),
                Container(
                  width: 60.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: AppColors.cA7A7A7,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.c090909,
                      size: 20,
                    )),
              ],
            ),
            Gap(30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "برجاء قراءة الاحكام والشروط قبل حذف الحساب.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle(
                    color: AppColors.c090909,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.c090909,
                    weight: FontWeight.w700,
                    size: 16,
                  ),
                ),
                Gap(20.h),
                Text(
                  "ماهي اسبابك اللتي تدفعك لحذف الحساب؟",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle(
                    color: AppColors.c090909,
                    weight: FontWeight.w400,
                    size: 16,
                  ),
                ),
                Gap(10.h),
                ListView.builder(
                    itemCount: profileCubit.reasons.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          profileCubit.changeReason(index);
                        },
                        child: Row(
                          children: [
                            Checkbox(
                                value: profileCubit.reasonIndex == index,
                                checkColor: AppColors.white,
                                side: const BorderSide(
                                  color: AppColors.cEAEAEA,
                                  width: 1.5,
                                ),
                                visualDensity:
                                    const VisualDensity(horizontal: -3),
                                onChanged: (val) {
                                  profileCubit.changeReason(index);
                                }),
                            Text(
                              profileCubit.reasons[index],
                              textAlign: TextAlign.center,
                              style: AppTextStyles.textStyle(
                                color: AppColors.c969AA0,
                                weight: FontWeight.w400,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                CustomButtonInternet(
                  height: 48,
                  width: 361,
                  horizontal: 0,
                  title: "الغاء",
                  onTap: () => Navigator.pop(context),
                ),
                CustomButtonInternet(
                    height: 48,
                    width: 361,
                    horizontal: 0,
                    vertical: 0,
                    colorBg: AppColors.transparent,
                    borderColor: AppColors.transparent,
                    txtColor: AppColors.cE74C3C,
                    title: "حذف الحساب",
                    onTap: () {
                      Navigator.pop(context);
                      showAnimatedDialog(context,
                          BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                        return MyDialog(
                          description: "هل انت متاكد من انك تريد حذف الحساب",
                          isFailed: false,
                          image: ImageConstants.said,
                          onTapConfirm: () {
                            context.read<ProfileCubit>().removeAccount();
                          },
                        );
                      }),
                          dismissible: false, isFlip: true);
                    }),
              ],
            ),
          ],
        ),
      );
    });
  }

  // BlocConsumer<ProfileCubit, ProfileState> removeButton() {
  //   return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
  //     if (state is RemoveAccountFailure) {
  //       CustomMessage.showMessage(context,
  //           message: NetworkExceptions.getErrorMessage(
  //             state.networkExceptions,
  //           ),
  //           type: AlertType.failed);
  //     } else if (state is RemoveAccountSuccess) {
  //       Navigator.pushReplacementNamed(
  //         context,
  //         AppRoutes.initScreen,
  //       );
  //     }
  //   }, builder: (context, state) {
  //     if (state is RemoveAccountInitial) {
  //       return CustomButtonInternet(
  //           height: 48,
  //           width: 361,
  //           horizontal: 0,
  //           vertical: 0,
  //           colorBg: AppColors.transparent,
  //           borderColor: AppColors.transparent,
  //           txtColor: AppColors.cE74C3C,
  //           title: "حذف الحساب",
  //           onTap: () {
  //             Navigator.pop(context);
  //             showAnimatedDialog(context,
  //                 BlocBuilder<ProfileCubit, ProfileState>(
  //                     builder: (context, state) {
  //               return MyDialog(
  //                 description: "هل انت متاكد من انك تريد حذف الحساب",
  //                 isFailed: false,
  //                 onTapConfirm: () {
  //                   context.read<ProfileCubit>().removeAccount();
  //                 },
  //               );
  //             }), dismissible: false, isFlip: true);
  //           });
  //     } else if (state is RemoveAccountLoading) {
  //       return const Center(child: CustomLoading());
  //     } else {
  //       return CustomButtonInternet(
  //           height: 48,
  //           width: 361,
  //           horizontal: 0,
  //           vertical: 0,
  //           colorBg: AppColors.transparent,
  //           borderColor: AppColors.transparent,
  //           txtColor: AppColors.cE74C3C,
  //           title: "حذف الحساب",
  //           onTap: () {
  //             Navigator.pop(context);
  //             showAnimatedDialog(context,
  //                 BlocBuilder<ProfileCubit, ProfileState>(
  //                     builder: (context, state) {
  //               return MyDialog(
  //                 description: "هل انت متاكد من انك تريد حذف الحساب",
  //                 isFailed: false,
  //                 onTapConfirm: () {
  //                   context.read<ProfileCubit>().removeAccount();
  //                 },
  //               );
  //             }), dismissible: false, isFlip: true);
  //           });
  //     }
  //   });
  // }
}
