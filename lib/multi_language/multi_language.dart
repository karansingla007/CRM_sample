import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/constants/shared_pref_constant.dart';
import 'package:flutter_assignment/main.dart';
import 'package:flutter_assignment/multi_language/multi_languages_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiLanguage {
  final Locale locale;

  MultiLanguage({this.locale = const Locale.fromSubtags(languageCode: 'en')});

  static MultiLanguage? od(BuildContext context) {
    return Localizations.of<MultiLanguage>(context, MultiLanguage);
  }

  void keepLocalKey(String localKey) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefConstant.localKey);
    prefs.setString(SharedPrefConstant.localKey, localKey);
  }

  Future<String> readLocalKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefConstant.localKey) ?? 'en';
  }

  void setLocalKey(BuildContext context, Locale locale) async {
    keepLocalKey(locale.languageCode);
    MyApp.setLocale(context: context, locale: locale);
  }

  static const LocalizationsDelegate<MultiLanguage> delegate =
      MultiLanguagesDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key]!;
  }
}
