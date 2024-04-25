import 'package:completed/features/checkout/presentation/widgets/select_payment_type.dart';
import '../../../../core/src/app_export.dart';
import '../../../services/data/models/services/services_model.dart';
import '../../cubit/checkout_cubit.dart';

class CustomCheckoutDetailsBody extends StatelessWidget {
  final ServicesModel service;
  const CustomCheckoutDetailsBody({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// details
        Gap(20.h),
        Text(
          "تفاصيل الطلب",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w500, color: AppColors.c090909, size: 16),
        ),
        Gap(15.h),

        Container(
          width: 363.w,
          height: 225.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: AppColors.cFFFCEF,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              Text(
                "تفاصيل سعر الطلب",
                style: AppTextStyles.textStyle(
                    weight: FontWeight.w500,
                    color: AppColors.c090909,
                    size: 16),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الفرعي",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c636363,
                        size: 14),
                  ),
                  Text(
                    service.price.toString(),
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c636363,
                        size: 12),
                  ),
                ],
              ),
              Gap(5.h),
              BlocBuilder<CheckoutCubit,
                  CheckoutState>(
                  builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تخفيض",
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w500,
                          color: AppColors.c636363,
                          size: 14),
                    ),
                    Text(
                    context.read<CheckoutCubit>().checkCodeDetails == null
                        ? "0"
                        : context.read<CheckoutCubit>().checkCodeDetails!.value ?? "0",
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w700,
                          color: AppColors.c636363,
                          size: 12),
                    ),
                  ],
                );
              }),
              Gap(5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ضريبة",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c636363,
                        size: 14),
                  ),
                  Text("0",
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.c636363,
                        size: 12),
                  ),
                ],
              ),
              Gap(5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الاجمالي",
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w500,
                        color: AppColors.c090909,
                        size: 14),
                  ),
                  Text(context.read<CheckoutCubit>().checkCodeDetails == null
                      ? service.price.toString()
                      : (double.parse(service.price.toString())
                         - double.parse(
                          context.read<CheckoutCubit>()
                              .checkCodeDetails!.value.toString())).toString(),
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.textStyle(
                        weight: FontWeight.w700,
                        color: AppColors.primary,
                        size: 14),
                  ),
                ],
              ),
              Gap(5.h),
              Container(
                width: 324.w,
                alignment: Alignment.center,
                child: Text(
                  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w500,
                      color: AppColors.cC3CBD3,
                      size: 14),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputFormField(
                      height: 48.h,
                      width: 242.w,
                      fillColor: AppColors.white,
                      borderColor: AppColors.white,
                      hint: "كود الخصم",
                      controller: context.read<CheckoutCubit>().codeController,
                      suffixIcon: Container(
                        width: 24.w,
                        height: 24.h,
                        padding: EdgeInsets.all(8.w),
                        child: SvgPicture.asset(
                          ImageConstants.discount,
                        ),
                      )),
                  BlocBuilder<CheckoutCubit, CheckoutState>(
                      builder: (context, state) {
                    if (state is CheckCodeLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return CustomButtonInternet(
                          height: 48,
                          width: 73.3,
                          horizontal: 0,
                          vertical: 0,
                          title: "تاكيد",
                          onTap: () {
                            context
                                .read<CheckoutCubit>()
                                .checkCode(service.id.toString());
                          });
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
        Gap(20.h),
        Text(
          "طريقة الدفع",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        Gap(5.h),
        const SelectPaymentType(),
      ],
    );
  }
}