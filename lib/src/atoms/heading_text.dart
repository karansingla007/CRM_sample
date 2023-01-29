import 'package:flutter/cupertino.dart';

class HeadingText extends Text {
  final String text;
  final Color? textColor;
  final TextOverflow? textOverflow;
  HeadingText(
      {super.key, required this.text, this.textColor, this.textOverflow})
      : super(text,
            style: TextStyle(
              color: textColor,
              fontSize: 24,
              overflow: textOverflow,
              fontWeight: FontWeight.bold,
            ));
}
