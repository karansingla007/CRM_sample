import 'package:flutter/material.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';

class MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguage> {
  const MultiLanguagesDelegate();
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'de'].contains(locale.languageCode);
  }

  /// read Json
  @override
  Future<MultiLanguage> load(Locale locale) async {
    // MultiLanguages class is where the JSON loading actually runs

    MultiLanguage localizations = MultiLanguage(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MultiLanguagesDelegate old) => false;
}
