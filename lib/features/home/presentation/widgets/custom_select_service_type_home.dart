import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';

class CustomSelectServiceTypeHome extends StatelessWidget {
  const CustomSelectServiceTypeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        typeWidget(
          image: ImageConstants.arafat,
          title: "the_hajj".tr(context),
          width: 90.w,
          height: 65.h,
          onTap: (){
            if(context.read<HomeCubit>().hajj == null){
              CustomMessage.showMessage(context,
                  message: "hajj_service_not_available_now".tr(context),
                  type: AlertType.warning);
            }
            else{
              Navigator.pushNamed(
                  context,
                  AppRoutes.serviceDetails,
                  arguments: [
                    context.read<HomeCubit>().hajj,
                    TitleIdListModel(
                      id: 0,title: "the_hajj".tr(context),
                  ),
                    null]
              );
            }
          },
        ),
        typeWidget(
          image: ImageConstants.kaba,
          title: "the_amra".tr(context),
          width: 65.w,
          height: 72.h,
          onTap: () => Navigator.pushNamed(context,
              AppRoutes.servicesScreen,
            arguments: TitleIdListModel(
              id: 1,title: "the_amra".tr(context),
            ),
          ),
        ),
        typeWidget(
          image: ImageConstants.musiq,
          title: "additional_services".tr(context),
          width: 40.w,
          height: 72.h,
          onTap: () => Navigator.pushNamed(context,
            AppRoutes.servicesScreen,
            arguments: TitleIdListModel(
                id: 3,title: "additional_services".tr(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget typeWidget({
    required String title,
    required String image,
    required double width,
    required double height,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 360.w,
        height: 125.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            stops: const [0.3,0.6],
            colors: [
              AppColors.cA79038.withOpacity(0.0),
              AppColors.cA79038,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 1.0),
              blurRadius: .5,
            ),
          ],
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.7),
          child: Container(
              width: 360.w,
              height: 125.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width.w,
                    height: height.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(image))),
                  ),

                  Gap(10.h),
                  Text(
                    title,
                    style: AppTextStyles.textStyle(
                        size: 14,
                        weight: FontWeight.w600,
                        color: AppColors.c201C17),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}