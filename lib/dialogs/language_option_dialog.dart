import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/atoms/heading_text.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';

class LanguageOptionsDialog extends StatelessWidget {
  final Function(String) onSelectLanguage;
  const LanguageOptionsDialog({super.key, required this.onSelectLanguage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16.0, right: 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadingText(
                text: MultiLanguage.od(context)!
                    .translate(Strings.chooseLanguage)),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
                onTap: () {
                  onSelectLanguage('en');
                },
                child: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: SimpleText(text: Strings.english))),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
                onTap: () {
                  onSelectLanguage('de');
                },
                child: Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: SimpleText(text: Strings.deutsche))),
          ],
        ),
      ),
    );
  }
}
