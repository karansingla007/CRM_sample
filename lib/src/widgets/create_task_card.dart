import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/atoms/small_text.dart';

class CreateTaskCard extends StatelessWidget {
  final Function() onPressed;
  const CreateTaskCard({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.add,
              ),
              SmallText(
                text: MultiLanguage.od(context)!.translate(Strings.createTask),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
