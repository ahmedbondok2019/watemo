import '../../../../core/src/app_export.dart';

class CustomTotalOrderHome extends StatelessWidget {
  const CustomTotalOrderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          typeWidget(
            color: AppColors.primary,
            txtColor: AppColors.white,
            title: "${context.read<HomeCubit>().totalOrders} \n كل الطلبات",
            onTap: () {},
          ),

          typeWidget(
            color: AppColors.cF6F4EC,
            txtColor: AppColors.primary,
            title: "${context.read<HomeCubit>().currentOrders} \n الطلبات الجارية",
            onTap: () {},
          ),

          typeWidget(
            color: AppColors.cF6F4EC,
            txtColor: AppColors.c00D261,
            title: "${context.read<HomeCubit>().vendorTotalProfit} \n الأرباح",
            onTap: () {},
          ),
        ],
      );
    });
  }

  Widget typeWidget({
    required String title,
    required Color color,
    required Color txtColor,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 110.w,
          height: 105.h,
          padding: EdgeInsets.all(2.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1,
              color: AppColors.cE3DCC4,
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle(
                size: 14,
                height: 1.7,
                weight: FontWeight.w700,
                color: txtColor),
          )
      ),
    );
  }
}
