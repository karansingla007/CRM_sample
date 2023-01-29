import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/databases/task_card/model/task_card.dart';
import 'package:flutter_assignment/dialogs/task_create_dialog.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/atoms/heading_text.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';
import 'package:flutter_assignment/src/molecules/app_bar_base.dart';
import 'package:flutter_assignment/src/widgets/select_members_widget.dart';
import 'package:flutter_assignment/utils/time_util.dart';
import 'package:flutter_assignment/utils/util.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskCard taskCard;
  final Function(String, String, String, int, int) onUpdateTask;

  const TaskDetailScreen({
    super.key,
    required this.taskCard,
    required this.onUpdateTask,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(
        title: SimpleText(
            text: MultiLanguage.od(context)!.translate(Strings.taskDetail)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: TaskCreateDialog(
                    isFromEdit: true,
                    onClickUpdate: (heading, body, memberIds, endTime, taskId) {
                      onUpdateTask(heading, body, memberIds, endTime, taskId);
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    },
                    taskCard: taskCard,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            HeadingText(
              text: taskCard.heading,
            ),
            const SizedBox(
              height: 8,
            ),
            SimpleText(
              text: taskCard.body,
            ),
            const SizedBox(
              height: 16,
            ),
            SimpleBoldText(
              text: MultiLanguage.od(context)!.translate(Strings.members),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 48,
              child: SelectMembersWidget(
                  memberIds: Util.csvToList(taskCard.members)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleBoldText(
                      text: MultiLanguage.od(context)!
                          .translate(Strings.deadline),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SimpleText(
                      text: TimeUtil.convertEpochToDateTimeString(
                          taskCard.endTime),
                    ),
                  ],
                ),
                const Spacer(),
                taskCard.status == CrmHeaders.done.name
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SimpleBoldText(
                            text: MultiLanguage.od(context)!
                                .translate(Strings.actualEndDateTime),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SimpleText(
                            text: TimeUtil.convertEpochToDateTimeString(
                                taskCard.actualEndTime!),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleBoldText(
                  text: "Total Time Spend",
                ),
                const SizedBox(
                  height: 8,
                ),
                SimpleText(
                  text:
                      "${TimeUtil.getTimeDiff(taskCard.totalTimeSpend)} Spend",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
