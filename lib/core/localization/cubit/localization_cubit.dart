import '../../../core/src/app_export.dart';
import '../../common/models/lang_model.dart';
part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationInit());
  int lang = 0;

  static LocalizationBloc get(context) =>
      BlocProvider.of<LocalizationBloc>(context);

  List<LangModel> langList = [
    LangModel(name: "Arabic", code: "ar",image: ImageConstants.arabic),
    LangModel(name: "English", code: "en",image: ImageConstants.english),
    LangModel(name: "Franch", code: "fr",image: ImageConstants.france),
    LangModel(name: "Türkiye", code: "tur",image: ImageConstants.turkiye),
    LangModel(name: "Urdu", code: "urd",image: ImageConstants.urdu),
    LangModel(name: "Hausa", code: "hau",image: ImageConstants.hausa),
  ];

  void changeLanguage(int index) {
    lang = index;
    getIt<SharedPreferences>()
        .setString("locale", AppLocalization.supportedLocales[index].toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales[index],
      ),
    );
  }

  void changeLanguageToArabic() {
    lang = 0;
    getIt<SharedPreferences>()
        .setString("locale", AppLocalization.supportedLocales.first.toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.first,
      ),
    );
  }

  void changeLanguageToEnglish() {
    lang = 1;
    getIt<SharedPreferences>()
        .setString("locale", AppLocalization.supportedLocales.last.toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.last,
      ),
    );
  }
}
