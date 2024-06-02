import 'dart:ui';
import '../../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../../core/common/widgets/custom_bottom_sheet_select_provider.dart';
import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import '../../../checkout/data/models/create_order/create_order_req_model.dart';
import '../../../home/data/models/hajj_model.dart';
import '../../cubit/services_cubit.dart';
import '../../data/models/services/services_model.dart';
import '../widgets/custom_service_details_body.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final HajjModel? hajj;
  final TitleIdListModel titleId;
  final ServicesModel? service;

  const ServiceDetailsScreen({
    super.key, required this.hajj,
    required this.titleId,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => ServicesCubit.get(context).clearData(),
      child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// button
          CustomButtonInternet(
              height: 48,
              width: 240,
              horizontal: 0,
              title: "التالي",
              onTap: () {
                if (context
                    .read<ServicesCubit>()
                    .nameController
                    .text
                    .isEmpty) {
                  CustomMessage.showMessage(context,
                      message: "يجب كتابة اسم الشخص", type: AlertType.warning);
                }
                else if (context.read<ServicesCubit>().relation == null) {
                  CustomMessage.showMessage(context,
                      message: "يجب اختيار صلة القرابة",
                      type: AlertType.warning);
                }
                else {
                  if(titleId.id == 3){
                    service!.counter = context.read<ServicesCubit>().counter;
                  }
                  else{
                    if(service != null){
                      service!.counter = 1;
                    }
                  }

                  if(titleId.id == 3){
                    Navigator.pushNamed(
                      context,
                      AppRoutes.checkout,
                      arguments: [
                        service,
                        hajj,
                        CreateOrderReqModel(
                          onBehalfOf: context.read<ServicesCubit>().nameController.text.trim(),
                          userRelation: context.read<ServicesCubit>().relation!.id.toString(),
                          notes: context.read<ServicesCubit>().noteController.text.trim(),
                          languages: null,
                          sex: "0",
                        ),
                        context.read<ServicesCubit>().selectServicesList,
                      ],
                    );
                  }
                  else{
                    showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      builder: (cont) => BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: BlocBuilder<ServicesCubit,
                            ServicesState>(builder: (cont, state) {
                          return CustomBottomSheetProvider(
                            service: service,
                            hajj: hajj,
                            languages: context.read<ServicesCubit>().languages,
                            onBehalfOf: context.read<ServicesCubit>().nameController.text.trim(),
                            userRelation: context.read<ServicesCubit>().relation!.id.toString(),
                            notes: context.read<ServicesCubit>().noteController.text.trim(),
                            selectServicesList: context.read<ServicesCubit>().selectServicesList,
                          );
                        }),),
                    );
                  }
                }
              }),

          /// total service
          SizedBox(
            width: 100.w,
            height: 48.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "سعر الخدمة",
                  style: AppTextStyles.textStyle(
                      weight: FontWeight.w500,
                      color: AppColors.c090909,
                      size: 14),
                ),
                Gap(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      hajj != null
                          ? hajj!.price.toString()
                          : service!.price.toString(),
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w700,
                          color: AppColors.c090909,
                          size: 13),
                    ),
                    Gap(5.w),
                    Text(
                      "ريال",
                      style: AppTextStyles.textStyle(
                          weight: FontWeight.w500,
                          color: AppColors.c090909,
                          size: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: BackgroundComponent(
          opacity: 0.2,
          child: Column(
            children: [
              CustomAppBar(
                title: "خدمة ${titleId.title}",
                titleSize: 16,
                leading: const CustomBackButton(),
                actions: const [NotificationIcon()],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomServiceDetailsBody(
                      titleId: titleId,
                      service: service,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    ),
    );
  }
}