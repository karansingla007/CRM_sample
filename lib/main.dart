import 'package:flutter/material.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale({
    required BuildContext context,
    required Locale locale,
  }) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    if (state != null) {
      state.setLocale(locale);
    }
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Locale _locale = const Locale.fromSubtags(languageCode: 'en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final multiLanguage = MultiLanguage();
    final localeKey = await multiLanguage.readLocalKey();
    if (localeKey == "en") {
      _locale = const Locale("en", "EN");
    } else {
      _locale = const Locale.fromSubtags(languageCode: 'de');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale.fromSubtags(languageCode: 'de'),
      ],
      localizationsDelegates: const [
        MultiLanguage.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
              supportedLocaleLanguage.countryCode == locale?.countryCode) {
            return supportedLocaleLanguage;
          }
        }
      },
      title: 'CRM Sample project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
