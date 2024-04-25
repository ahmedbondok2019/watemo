import '../../../features/checkout/data/models/create_order/create_order_req_model.dart';
import '../../../features/services/cubit/services_cubit.dart';
import '../../../features/services/data/models/services/services_model.dart';
import '../../src/app_export.dart';

class CustomBottomSheetProvider extends StatelessWidget {
  final ServicesModel service;
  final CreateOrderReqModel orderDetails;
  const CustomBottomSheetProvider({
    super.key,required this.service,required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    ServicesCubit servicesCubit = BlocProvider.of<ServicesCubit>(context);
    return BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
        return Container(
          width: 393.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(15.h),
                    Container(
                      width: 60.w,height: 5.h,
                      decoration: BoxDecoration(
                        color: AppColors.cA7A7A7,
                        borderRadius: BorderRadius.circular(2.5.r),
                      ),
                    ),

                    Gap(20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "جنس المعتمر",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textStyle(
                            color: AppColors.c090909,
                            weight: FontWeight.w700,
                            size: 16,
                          ),
                        ),
                        Gap(10.h),
                        Container(
                          height: 56.h,
                          width: 361.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.12),
                                blurRadius: 24,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButtonInternet(
                                title: "ذكر",
                                horizontal: 0,
                                size: 16,
                                vertical: 0,
                                height: 40,
                                width: 172,
                                colorBg: servicesCubit.gender ? null : AppColors.white,
                                txtColor: servicesCubit.gender ? null : AppColors.c090909,
                                // txtColor: servicesCubit.gender ? null : AppColors.c9A9A9A,
                                onTap: servicesCubit.changeStatusGender,
                              ),

                              CustomButtonInternet(
                                title: "انثي",
                                horizontal: 0,
                                vertical: 0,
                                height: 40,
                                width: 172,
                                colorBg: servicesCubit.gender ? AppColors.white : null,
                                txtColor: servicesCubit.gender ? AppColors.c090909 : null,
                                // txtColor: servicesCubit.gender ? AppColors.c9A9A9A : null,
                                onTap: servicesCubit.changeStatusGender,
                              ),
                            ],
                          ),
                        ),

                        Gap(15.h),
                        Text(
                          "اللغات اللي يتحدث بها",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textStyle(
                            color: AppColors.c090909,
                            weight: FontWeight.w700,
                            size: 16,
                          ),
                        ),
                        Gap(10.h),

                        SizedBox(
                            width: 361.w,
                          height: 130.h,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3.5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (_, index) => CustomButtonInternet(
                                height: 42,
                                width: 95,
                                horizontal: 5,
                                vertical: 0,
                                size: 12,
                                txtColor: AppColors.c090909,
                                weight: FontWeight.w500,
                                colorBg: AppColors.white,
                                borderColor: servicesCubit.selectLang.isNotEmpty
                                  ? servicesCubit.selectLang.contains(
                                    servicesCubit.languages[index].id)
                                    ? AppColors.primary
                                    : AppColors.cEAEAEA
                                : AppColors.cEAEAEA ,
                                title: servicesCubit.languages[index].title,
                                onTap: (){
                                  if(servicesCubit.selectLang.contains(
                                      servicesCubit.languages[index].id)){
                                    servicesCubit.removeLang(index);
                                  }
                                  else{
                                    servicesCubit.changeStatusLang(
                                        servicesCubit.languages[index].id!);
                                  }
                                },
                              ),
                              itemCount: servicesCubit.languages.length,
                            ),
                        ),

                        Gap(20.h),
                        Text(
                          "طريقة التوثيق",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textStyle(
                            color: AppColors.c090909,
                            weight: FontWeight.w700,
                            size: 16,
                          ),
                        ),
                        Gap(10.h),
                        SizedBox(
                            width: 361.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomButtonInternet(
                                      height: 42,
                                      width: 95,
                                      horizontal: 5,
                                      vertical: 0,
                                      size: 12,
                                      txtColor: AppColors.c090909,
                                      weight: FontWeight.w500,
                                      colorBg: AppColors.white,
                                      borderColor: servicesCubit.selectMethod == 1
                                          ? AppColors.primary
                                          : AppColors.cEAEAEA,
                                      title: "تصوير فيديو",
                                      onTap: (){
                                        servicesCubit.changeStatusMethod(1);
                                      },
                                    ),
                                    CustomButtonInternet(
                                      height: 42,
                                      width: 95,
                                      horizontal: 5,
                                      vertical: 0,
                                      size: 12,
                                      txtColor: AppColors.c090909,
                                      weight: FontWeight.w500,
                                      colorBg: AppColors.white,
                                      borderColor: servicesCubit.selectMethod == 2
                                          ? AppColors.primary
                                          : AppColors.cEAEAEA,
                                      title: "تسجيل صوتي",
                                      onTap: (){
                                        servicesCubit.changeStatusMethod(2);
                                      },
                                    ),
                                  ],
                                ),

                                Gap(5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomButtonInternet(
                                      height: 42,
                                      width: 95,
                                      horizontal: 5,
                                      vertical: 0,
                                      size: 12,
                                      txtColor: AppColors.c090909,
                                      weight: FontWeight.w500,
                                      colorBg: AppColors.white,
                                      borderColor: servicesCubit.selectMethod == 3
                                          ? AppColors.primary
                                          : AppColors.cEAEAEA,
                                      title: "متابعة التحرك",
                                      onTap: (){
                                        servicesCubit.changeStatusMethod(3);
                                      },
                                    ),
                                    CustomButtonInternet(
                                      height: 42,
                                      width: 95,
                                      horizontal: 5,
                                      vertical: 0,
                                      size: 12,
                                      txtColor: AppColors.c090909,
                                      weight: FontWeight.w500,
                                      colorBg: AppColors.white,
                                      borderColor: servicesCubit.selectMethod == 4
                                          ? AppColors.primary
                                          : AppColors.cEAEAEA,
                                      title: "التقاط صور",
                                      onTap: (){
                                        servicesCubit.changeStatusMethod(4);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButtonInternet(
                              height: 48,
                              width: 172,
                              horizontal: 0,
                              title: "التالي",
                              onTap: ()=> Navigator.pushNamed(
                                  context, AppRoutes.provider,
                                  arguments: [
                                    service,
                                    orderDetails,
                                    servicesCubit.selectLang,
                                    (servicesCubit.gender ? 1 : 0).toString(),
                                    servicesCubit.selectMethod,
                                  ],
                              ),
                            ),

                            CustomButtonInternet(
                              height: 48,
                              width: 172,
                              horizontal: 0,
                              colorBg: AppColors.white,
                              txtColor: AppColors.c090909,
                              borderColor: AppColors.c090909,
                              title: "الغاء",
                              onTap: ()=>Navigator.pop(context),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                Positioned(
                    left: 10.w,
                    top: 24.h,
                    child: InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: SvgPicture.asset(ImageConstants.close,
                        width: 16.w,
                        height: 16.h,
                      ),
                    )
                )
              ],
            )
        );
    });
  }
}
