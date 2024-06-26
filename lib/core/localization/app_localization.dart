import 'package:flutter/foundation.dart';

import '../src/app_export.dart';
import 'lang/ar_eg.dart';
import 'lang/en_us.dart';
import 'lang/fr_fr.dart';
import 'lang/hau_hau.dart';
import 'lang/tur_tur.dart';
import 'lang/urd_urd.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'ar': arEg,
    'en': enUs,
    'fr': frFr,
    'tr': turTur,
    'ur': urdUrd,
    'hu': hauHau,
  };

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const List<Locale> supportedLocales = [
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
    Locale('tr'),
    Locale('ur'),
    Locale('hu'),
  ];

  static List<String> languages() => _localizedValues.keys.toList();

  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

extension LocalizationExtension on String {
  String tr(BuildContext context) =>
      AppLocalization.of(context).getString(this);
}
