import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/databases/task_card/model/task_card.dart'
    as task_card_model;
import 'package:flutter_assignment/dialogs/language_option_dialog.dart';
import 'package:flutter_assignment/dialogs/task_create_dialog.dart';
import 'package:flutter_assignment/multi_language/multi_language.dart';
import 'package:flutter_assignment/src/atoms/simple_text.dart';
import 'package:flutter_assignment/src/molecules/app_bar_base.dart';
import 'package:flutter_assignment/src/screens/task_detail_screen.dart';
import 'package:flutter_assignment/src/widgets/create_task_card.dart';
import 'package:flutter_assignment/src/widgets/task_card.dart';
import 'package:flutter_assignment/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/crm_screen/crm_screen.dart';

class HomeScreen extends StatelessWidget {
  final CrmScreenBloc _crmScreenBloc = CrmScreenBloc();
  final MultiLanguage multiLanguage = MultiLanguage();

  HomeScreen({super.key}) {
    _crmScreenBloc.add(const InitCrmScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(
        title: SimpleText(
            text: MultiLanguage.od(context)!.translate(Strings.crmSample)),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text(MultiLanguage.od(context)!
                    .translate(Strings.changeLanguage)),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                    MultiLanguage.od(context)!.translate(Strings.exportToCsv)),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: LanguageOptionsDialog(
                      onSelectLanguage: (selectedLanguage) async {
                    Navigator.pop(context);
                    if (await multiLanguage.readLocalKey() !=
                        selectedLanguage) {
                      if (selectedLanguage == 'en') {
                        multiLanguage.setLocalKey(
                            context, const Locale("en", "EN"));
                      } else {
                        multiLanguage.setLocalKey(context,
                            Locale.fromSubtags(languageCode: selectedLanguage));
                      }
                    }
                  }),
                ),
              );
            } else if (value == 1) {
              _crmScreenBloc.add(const ExportToCsv());
            }
          }),
        ],
      ),
      body: BlocBuilder<CrmScreenBloc, CrmScreenState>(
        bloc: _crmScreenBloc,
        builder: (BuildContext context, CrmScreenState state) {
          if (state is CrmScreenInitializing) {
            return const CircularProgressIndicator();
          } else if (state is OnCrmScreenInitialized) {
            List<DragAndDropList> contents = [];
            CrmHeaders.values.forEach((element) {
              contents.add(DragAndDropList(
                  header: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                    child: SimpleText(
                        text:
                            MultiLanguage.od(context)!.translate(element.name)),
                  ),
                  footer: element.name == CrmHeaders.todo.name
                      ? CreateTaskCard(onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: TaskCreateDialog(onClickCreate:
                                  (heading, body, members, endTimeStamp) {
                                _crmScreenBloc.add(
                                  OnTaskCreate(
                                      heading: heading,
                                      body: body,
                                      members: members,
                                      status: CrmHeaders.todo.name,
                                      endTime: endTimeStamp),
                                );
                                Navigator.pop(context);
                              }),
                            ),
                          );
                        })
                      : Container(),
                  children: Util.isValidList(state.data[element.name])
                      ? List.generate(state.data[element.name]!.length,
                          (index) {
                          task_card_model.TaskCard currentTask =
                              state.data[element.name]![index];
                          return DragAndDropItem(
                            child: TaskCard(
                              heading: currentTask.heading,
                              body: currentTask.body,
                              memberIds: currentTask.members,
                              endTimeStamp: currentTask.endTime,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskDetailScreen(
                                            taskCard: currentTask,
                                            onUpdateTask: (heading, body,
                                                memberIds, endTime, taskId) {
                                              _crmScreenBloc.add(OnTaskUpdate(
                                                heading: heading,
                                                members: memberIds,
                                                endTime: endTime,
                                                body: body,
                                                taskId: taskId,
                                              ));
                                            },
                                          )),
                                );
                              },
                            ),
                          );
                        })
                      : []));
            });
            return DragAndDropLists(
              children: contents,
              onItemReorder: (int oldItemIndex, int oldListIndex,
                  int newItemIndex, int newListIndex) {
                _crmScreenBloc.add(OnItemMoved(
                    oldItemIndex: oldItemIndex,
                    oldListIndex: oldListIndex,
                    newItemIndex: newItemIndex,
                    newListIndex: newListIndex));
              },
              onListReorder: (int oldListIndex, int newListIndex) {},
              axis: Axis.horizontal,
              listWidth: 180,
              listDraggingWidth: 180,
              listDecoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 3.0,
                    blurRadius: 6.0,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              listPadding: const EdgeInsets.all(8.0),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
