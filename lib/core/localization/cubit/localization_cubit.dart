import '../../../core/src/app_export.dart';
import '../../common/models/lang_model.dart';
part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationInit());
  int lang = 0;
  bool isLtr = false;

  static LocalizationBloc get(context) =>
      BlocProvider.of<LocalizationBloc>(context);

  List<LangModel> langList = [
    LangModel(name: "عربي", code: "ar",image: ImageConstants.arabic),
    LangModel(name: "English", code: "en",image: ImageConstants.english),
    LangModel(name: "French", code: "fr",image: ImageConstants.france),
    LangModel(name: "Türkiye", code: "tr",image: ImageConstants.turkiye),
    LangModel(name: "Urdu", code: "ur",image: ImageConstants.urdu),
    LangModel(name: "Hausa", code: "hu",image: ImageConstants.hausa),
  ];

  void changeLanguage(int index) {
    lang = index;
    isLtr =
        langList[index].code != "ar" &&
            langList[index].code != "ur";
    getIt<SharedPreferences>()
        .setString("locale",
        AppLocalization.supportedLocales[index].toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales[index],
      ),
    );
  }
}
