import 'dart:developer';
import '../../../features/checkout/data/models/create_order/create_order_req_model.dart';
import '../../../features/home/data/models/hajj_model.dart';
import '../../../features/services/cubit/services_cubit.dart';
import '../../../features/services/data/models/services/services_model.dart';
import '../../../features/services/data/models/speak_languages/speak_lang_list_model.dart';
import '../../src/app_export.dart';
import '../../utils/custom_message.dart';

class CustomBottomSheetProvider extends StatelessWidget {
  final ServicesModel? service;
  final HajjModel? hajj;
  final List<SpeakLangListModel> languages;
  final String? onBehalfOf;
  final String? userRelation;
  final String? notes;
  final List<ServicesModel> selectServicesList;

  const CustomBottomSheetProvider({
    super.key,
    required this.service,
    required this.hajj,
    required this.languages,
    required this.notes,
    required this.onBehalfOf,
    required this.userRelation,
    required this.selectServicesList,
  });

  @override
  Widget build(BuildContext context) {
    ServicesCubit servicesCubit =
        BlocProvider.of<ServicesCubit>(context);
    return BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
      return Container(
          width: 393.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                20.r,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(15.h),
                  Container(
                    width: 60.w,
                    height: 5.h,
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
                        "جنس مقدم الخدمة",
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
                              colorBg:
                                  servicesCubit.gender ? null : AppColors.white,
                              txtColor: servicesCubit.gender
                                  ? null
                                  : AppColors.c090909,
                              onTap: servicesCubit.changeStatusGender,
                            ),
                            CustomButtonInternet(
                              title: "انثي",
                              horizontal: 0,
                              vertical: 0,
                              height: 40,
                              width: 172,
                              colorBg:
                                  servicesCubit.gender ? AppColors.white : null,
                              txtColor: servicesCubit.gender
                                  ? AppColors.c090909
                                  : null,
                              onTap: servicesCubit.changeStatusGender,
                            ),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      Text(
                        "اللغات مقدم الخدمة",
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                            colorBg: servicesCubit.selectLang.isNotEmpty
                                ? servicesCubit.selectLang
                                        .contains(languages[index].id)
                                    ? AppColors.cBEA235.withOpacity(0.16)
                                    : AppColors.white
                                : AppColors.white,
                            borderColor: servicesCubit.selectLang.isNotEmpty
                                ? servicesCubit.selectLang
                                        .contains(languages[index].id)
                                    ? AppColors.primary
                                    : AppColors.cEAEAEA
                                : AppColors.cEAEAEA,
                            title: languages[index].title ?? "",
                            onTap: () {
                              print("selectLang ====>>>> ${servicesCubit.selectLang}");
                              print("selectLang ====>>>> ${servicesCubit.selectLang.contains(languages[index].id)}");
                              print("index ====>>>> $index");
                              if (servicesCubit.selectLang.contains(languages[index].id)) {
                                int ind = servicesCubit.selectLang.indexOf(languages[index].id!);
                                if(ind != -1){
                                  servicesCubit.removeLang(ind);
                                }
                              } else {
                                servicesCubit
                                    .changeStatusLang(languages[index].id!);
                              }
                            },
                          ),
                          itemCount: languages.length,
                        ),
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButtonInternet(
                            height: 48,
                            width: 172,
                            horizontal: 0,
                            title: "التالي",
                            onTap: () {
                              print("lang ======>>>> ${servicesCubit.selectLang}");
                              if(servicesCubit.selectLang.isEmpty){
                                CustomMessage.showMessage(context,
                                    message: "يجب اختيار لغات مقدم الخدمة", type: AlertType.warning);
                              }
                              else{
                                String lang = "";
                                for (var element in servicesCubit.selectLang) {
                                  lang += "$element,";
                                }
                                print("lang ======>>>> $lang");
                                lang = lang.substring(0,lang.length -1);

                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.checkout,
                                  arguments: [
                                    service,
                                    hajj,
                                    CreateOrderReqModel(
                                      onBehalfOf: onBehalfOf,
                                      userRelation: userRelation,
                                      notes: notes,
                                      languages: lang,
                                      sex: (servicesCubit.gender ? 1 : 0).toString(),
                                    ),
                                    selectServicesList,
                                  ],
                                );
                              }
                            }
                          ),
                          CustomButtonInternet(
                            height: 48,
                            width: 172,
                            horizontal: 0,
                            colorBg: AppColors.white,
                            txtColor: AppColors.c090909,
                            borderColor: AppColors.c090909,
                            title: "الغاء",
                            onTap: () => Navigator.pop(context),
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
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      ImageConstants.close,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
              ),
            ],
          ),
      );
    });
  }
}
