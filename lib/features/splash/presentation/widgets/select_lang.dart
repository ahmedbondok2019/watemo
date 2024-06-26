import '../../../../core/src/app_export.dart';

class SelectLang extends StatelessWidget {
  const SelectLang({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationBloc localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    return BlocBuilder<LocalizationBloc,
        LocalizationState>(builder: (context, state) {
      return Column(
      children:
      localizationBloc.langList.map((lang) =>
          Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                height: 68.h,
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                    border: Border.all(
                        color: localizationBloc.langList.indexOf(lang) ==
                            localizationBloc.lang
                            ? AppColors.primary
                            : Colors.transparent
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.12),
                        blurRadius: .24,
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ]),
                child: Center(
                  child: ListTile(
                      leading: Image.asset(
                        lang.image!,
                        width: 30.w,
                        height: 24.h,
                      ),
                      title: Text(lang.name,
                        style: AppTextStyles.textStyle(
                          color: AppColors.c090909,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: (){
                          localizationBloc.changeLanguage(
                              localizationBloc.langList.indexOf(lang));
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                  color: localizationBloc.langList.indexOf(lang) ==
                                      localizationBloc.lang
                                      ? AppColors.primary
                                      : AppColors.cC7C7C7
                              ),
                              color: localizationBloc.langList.indexOf(lang) ==
                                  localizationBloc.lang
                                  ? AppColors.primary
                                  : null
                          ),
                          child: Image.asset(
                            ImageConstants.done,
                            color: AppColors.white,
                            width: 15,
                          ),
                        ),
                      )
                  ),
                ),
              ))
      ).toList(),
    );});
  }
}
