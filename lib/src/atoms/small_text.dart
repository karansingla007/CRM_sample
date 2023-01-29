import 'package:flutter/material.dart';

class SmallText extends Text {
  final String text;
  final Color? textColor;
  final TextOverflow? textOverflow;
  final int? maxLine;
  SmallText({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.textOverflow,
    this.maxLine,
  }) : super(text,
            maxLines: maxLine,
            style: TextStyle(
                color: textColor, fontSize: 14, overflow: textOverflow));
}
