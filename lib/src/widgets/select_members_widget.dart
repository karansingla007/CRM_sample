import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/molecules/circular_initials_name.dart';
import 'package:flutter_assignment/utils/util.dart';

class SelectMembersWidget extends StatelessWidget {
  final void Function(String, bool)? onClick;
  final List<String> memberIds;
  final String? selectedMemberIds;
  final bool isSmall;

  const SelectMembersWidget(
      {super.key,
      this.onClick,
      required this.memberIds,
      this.isSmall = false,
      this.selectedMemberIds});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: memberIds.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: isSmall ? 2 : 8,
          );
        },
        itemBuilder: (context, index) {
          return CircularInitialsName(
            memberId: memberIds[index],
            onClick: onClick,
            isSmall: isSmall,
            isSelected: Util.isStringNotNull(selectedMemberIds)
                ? selectedMemberIds!.contains(memberIds[index])
                : false,
          );
        });
  }
}
