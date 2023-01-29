import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final int maxLines;
  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const TextInput({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
