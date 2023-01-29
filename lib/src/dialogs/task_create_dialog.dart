import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/blocs/task_create_dialog/task_create_dialog.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/databases/task_card/model/task_card.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';
import 'package:flutter_assignment/src/atoms/text_input.dart';
import 'package:flutter_assignment/src/widgets/select_members_widget.dart';
import 'package:flutter_assignment/utils/time_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCreateDialog extends StatelessWidget {
  final TaskCard? taskCard;
  final bool isFromEdit;
  final Function(String, String, String, int)? onClickCreate;
  final Function(String, String, String, int, int)? onClickUpdate;

  final TextEditingController _headingTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TaskCreateDialogBloc _taskCreateDialogBloc = TaskCreateDialogBloc();

  TaskCreateDialog({
    super.key,
    this.taskCard,
    this.isFromEdit = false,
    this.onClickUpdate,
    this.onClickCreate,
  }) {
    if (taskCard != null) {
      _headingTextEditingController.text = taskCard!.heading;
      _descriptionTextEditingController.text = taskCard!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    String memberIds = taskCard == null ? "" : taskCard!.members;
    int endTimeStamp = taskCard == null ? 0 : taskCard!.endTime;
    return Card(
        margin: const EdgeInsets.only(left: 16.0, right: 16),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              TextInput(
                label: MultiLanguage.od(context)!
                    .translate(Strings.addTaskHeading),
                controller: _headingTextEditingController,
                maxLines: 2,
                onChanged: (value) {
                  _taskCreateDialogBloc.add(CheckButtonState(
                      heading: _headingTextEditingController.text,
                      body: _descriptionTextEditingController.text,
                      memberList: memberIds));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextInput(
                  label: MultiLanguage.od(context)!
                      .translate(Strings.addTaskDescription),
                  controller: _descriptionTextEditingController,
                  maxLines: 4,
                  onChanged: (value) {
                    _taskCreateDialogBloc.add(CheckButtonState(
                        heading: _headingTextEditingController.text,
                        body: _descriptionTextEditingController.text,
                        memberList: memberIds));
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: taskCard == null
                    ? TimeUtil.getCurrentDateTime().toString()
                    : TimeUtil.convertEpochToDateTime(endTimeStamp).toString(),
                firstDate: TimeUtil.getCurrentDateTime(),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText:
                    MultiLanguage.od(context)!.translate(Strings.date),
                timeLabelText:
                    MultiLanguage.od(context)!.translate(Strings.hour),
                onChanged: (val) {
                  endTimeStamp = TimeUtil.convertStringToEpochTime(val);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SimpleText(
                  text: MultiLanguage.od(context)!
                      .translate(Strings.taskMembers)),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 48,
                child: SelectMembersWidget(
                    onClick: (String selectedMemberId, bool isSelected) {
                      if (isSelected) {
                        memberIds = "$memberIds$selectedMemberId,";
                      } else {
                        memberIds =
                            memberIds.replaceFirst("$selectedMemberId,", "");
                      }
                      _taskCreateDialogBloc.add(CheckButtonState(
                          heading: _headingTextEditingController.text,
                          body: _descriptionTextEditingController.text,
                          memberList: memberIds));
                    },
                    memberIds: Strings.memberIdList,
                    selectedMemberIds: memberIds),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder(
                bloc: _taskCreateDialogBloc,
                builder: (context, state) {
                  if (state is CreateButtonState) {
                    return GestureDetector(
                      onTap: () {
                        if (onClickCreate != null) {
                          if (state.isEnable) {
                            onClickCreate!(
                                _headingTextEditingController.text,
                                _descriptionTextEditingController.text,
                                memberIds,
                                endTimeStamp);
                          }
                        } else {
                          onClickUpdate!(
                            _headingTextEditingController.text,
                            _descriptionTextEditingController.text,
                            memberIds,
                            endTimeStamp,
                            taskCard!.taskId,
                          );
                        }
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: getButtonColor(state.isEnable),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 16.0, left: 16, top: 8, bottom: 8),
                            child: SimpleText(
                              text: isFromEdit
                                  ? MultiLanguage.od(context)!
                                      .translate(Strings.update)
                                  : MultiLanguage.od(context)!
                                      .translate(Strings.create),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ));
  }

  Color? getButtonColor(bool isEnable) {
    if (onClickCreate != null) {
      if (isEnable) {
        return Colors.greenAccent;
      } else {
        return Colors.grey[400];
      }
    } else {
      return Colors.greenAccent;
    }
  }
}
