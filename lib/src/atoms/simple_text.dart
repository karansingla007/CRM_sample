import 'package:flutter/cupertino.dart';

class SimpleText extends Text {
  final String text;
  final Color? textColor;
  final TextOverflow? textOverflow;
  SimpleText({super.key, required this.text, this.textColor, this.textOverflow})
      : super(text,
            style: TextStyle(
                color: textColor, fontSize: 18, overflow: textOverflow));
}

class SimpleBoldText extends Text {
  final String text;
  final Color? textColor;
  final TextOverflow? textOverflow;
  final int? maxLine;
  SimpleBoldText({
    super.key,
    required this.text,
    this.textColor,
    this.textOverflow,
    this.maxLine,
  }) : super(text,
            maxLines: maxLine,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              overflow: textOverflow,
              fontWeight: FontWeight.bold,
            ));
}
