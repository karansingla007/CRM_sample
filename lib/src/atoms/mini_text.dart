import 'package:flutter/material.dart';

class MiniText extends Text {
  final String text;
  final Color? textColor;
  final TextOverflow? textOverflow;
  MiniText(
      {super.key,
      required this.text,
      this.textColor = Colors.black,
      this.textOverflow})
      : super(text,
            style: TextStyle(
                color: textColor, fontSize: 10, overflow: textOverflow));
}
