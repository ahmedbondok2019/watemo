import '../../../../core/src/app_export.dart';
import '../../../../core/utils/custom_message.dart';
import 'custom_drop_down_contact_type.dart';

class CustomContactUsBody extends StatelessWidget {
  const CustomContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(8.h),
        Text(
          "هل تحتاج المساعدة",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        Gap(8.h),
        Text(
          "خبرائنا علي استعداد دائماً لمساعدتك في اي وقت ولاتتردد في التواصل معنا إن كنت بحاجة الي مساعدة ولن نتأخر عنك ابداً",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w400, color: AppColors.c9A9A9A, size: 12),
        ),
        Gap(25.h),
        Text(
          "نوع الطلب",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        BlocBuilder<OtherPageCubit, OtherPageState>(builder: (context, state) {
          return CustomDropDownContactType(
            buttonWidth: double.infinity,
            list: context.read<OtherPageCubit>().contactTypeList,
            selectedItem: context.read<OtherPageCubit>().type ??
                context.read<OtherPageCubit>().contactTypeList.first,
            onChanged: context.read<OtherPageCubit>().changeContactType,
            label: "اختر نوع الطلب",
          );
        }),
        Gap(25.h),
        Text(
          "وصف الطلب",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600, color: AppColors.c090909, size: 16),
        ),
        Gap(15.h),
        InputFormField(
            hint: "قم بوصف ماتريد وسيتم التواصل معك في اقرب وقت .....",
            maxLines: 10,
            controller: context.read<OtherPageCubit>().messageController,
            fillColor: AppColors.white
        ),
        Gap(15.h),

        sendContactButton(),
      ],
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
            message: "تم ارسال طلبك وسوف يتم التواصل معك في اقرب وقت ممكن",
            type: AlertType.success);
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainLayer,
        );
      }
    },
        builder: (context, state) {
      if (state is ContactInitial) {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "ارسال الطلب",
          onTap: () {
            if (context.read<AuthCubit>().formKey.currentState!.validate()) {
              context.read<AuthCubit>().login();
            }
          },
        );
      }
      else if (state is ContactLoading) {
        return const Center(child: CustomLoading());
      }
      else {
        return CustomButtonInternet(
          height: 48,
          width: 361,
          horizontal: 0,
          title: "ارسال الطلب",
          onTap: () {
            if (context.read<OtherPageCubit>().type == null) {
              CustomMessage.showMessage(context,
                  message: "يجب اختيار نوع الطلب",
                  type: AlertType.failed);
            }else{
              context.read<OtherPageCubit>().sendContact();
            }
          },
        );
      }
    });
  }
}