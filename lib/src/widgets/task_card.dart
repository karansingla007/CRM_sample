import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';
import 'package:flutter_assignment/src/atoms/small_text.dart';
import 'package:flutter_assignment/src/widgets/select_members_widget.dart';
import 'package:flutter_assignment/utils/time_util.dart';
import 'package:flutter_assignment/utils/util.dart';

class TaskCard extends StatelessWidget {
  final String heading;
  final String body;
  final String memberIds;
  final int endTimeStamp;
  final Function() onClick;

  const TaskCard(
      {super.key,
      required this.heading,
      required this.body,
      required this.memberIds,
      required this.endTimeStamp,
      required this.onClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.brown[300],
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleBoldText(
              text: heading,
              maxLine: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            SmallText(
              text: body,
              textOverflow: TextOverflow.ellipsis,
              maxLine: 4,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
              child: SelectMembersWidget(
                memberIds: Util.csvToList(memberIds),
                isSmall: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmallText(
                      text: TimeUtil.convertEpochToString(endTimeStamp),
                      textOverflow: TextOverflow.ellipsis,
                      textColor: Colors.deepOrangeAccent),
                  const SizedBox(
                    width: 2,
                  ),
                  const Icon(
                    Icons.timer_sharp,
                    color: Colors.deepOrangeAccent,
                    size: 18.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
