import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_contact_type.dart';

class CustomContactUsBody extends StatelessWidget {
  const CustomContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<OtherPageCubit>().formKey,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(8.h),
          Text(
            "need_help".tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w600,
                color: AppColors.c090909, size: 16),
          ),
          Gap(8.h),
          Text(
            "subtitle_need_help".tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w400, color: AppColors.c9A9A9A, size: 12),
          ),
          Gap(25.h),
          Text(
            "order_type".tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w600, color: AppColors.c090909, size: 16),
          ),
          BlocBuilder<OtherPageCubit, OtherPageState>(builder: (context, state) {
            return CustomDropDownContactType(
              buttonWidth: double.infinity,
              list: context.read<OtherPageCubit>().contactTypeList,
              selectedItem: context.read<OtherPageCubit>().type,
              onChanged: context.read<OtherPageCubit>().changeContactType,
              label: "select_order_type".tr(context),
            );
          }),
          Gap(25.h),
          Text(
            "order_description".tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w600, color: AppColors.c090909, size: 16),
          ),
          Gap(15.h),
          InputFormField(
              hint: "help_description".tr(context),
              maxLines: 10,
              controller: context.read<OtherPageCubit>().messageController,
              fillColor: AppColors.white
          ),
          Gap(15.h),

          sendContactButton(),
        ],
      )
    );
  }

  BlocConsumer<OtherPageCubit, OtherPageState> sendContactButton() {
    return BlocConsumer<OtherPageCubit,
        OtherPageState>(listener: (context, state) {
      if (state is ContactFailure) {
        CustomMessage.showMessage(context,
            message: NetworkExceptions.getErrorMessage(
              state.networkExceptions,
            ),
            type: AlertType.failed);
      }
      else if (state is ContactSuccess) {
        CustomMessage.showMessage(context,
            message: "help_send_successful".tr(context),
            type: AlertType.success);
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainLayer,
        );
      }
    },
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(child: CustomLoading());
          }
          else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "send_help".tr(context),
          onTap: context.read<OtherPageCubit>().sendContact,
        );
      }
    });
  }
}