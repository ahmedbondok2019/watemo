part of 'localization_cubit.dart';

abstract class LocalizationState {
  final Locale locale;
  LocalizationState(this.locale);
}

class LocalizationInit extends LocalizationState {
  LocalizationInit() : super(AppLocalization.supportedLocales[0]);
}

class LocalizationChange extends LocalizationState {
  LocalizationChange(Locale locale) : super(locale);
}
