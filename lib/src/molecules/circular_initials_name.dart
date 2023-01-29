import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/src/atoms/mini_text.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';
import 'package:flutter_assignment/utils/util.dart';

class CircularInitialsName extends StatefulWidget {
  final String memberId;
  final void Function(String, bool)? onClick;
  final bool isSelected;
  final bool isSmall;

  const CircularInitialsName(
      {super.key,
      this.onClick,
      this.isSmall = false,
      required this.memberId,
      this.isSelected = false});

  @override
  State<CircularInitialsName> createState() => _CircularInitialsNameState();
}

class _CircularInitialsNameState extends State<CircularInitialsName> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onClick != null) {
          setState(() {
            isSelected = !isSelected;
          });

          widget.onClick!(widget.memberId, isSelected);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.lightGreen : Colors.white,
            border: Border.all(
                width: 1, color: isSelected ? Colors.green : Colors.black)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(widget.isSmall ? 2 : 8),
            child: widget.isSmall
                ? MiniText(
                    text: Util.getInitialFromFullName(
                        fullName: Strings.memberNameList[
                            Strings.memberIdList.indexOf(widget.memberId)]),
                  )
                : SimpleText(
                    text: Util.getInitialFromFullName(
                        fullName: Strings.memberNameList[
                            Strings.memberIdList.indexOf(widget.memberId)]),
                  ),
          ),
        ),
      ),
    );
  }
}
