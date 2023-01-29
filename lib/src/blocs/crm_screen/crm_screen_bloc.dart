import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:flutter_assignment/constants/constant.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/databases/task_card/daos/task_cards_dao.dart';
import 'package:flutter_assignment/databases/task_card/model/task_card.dart';
import 'package:flutter_assignment/src/blocs/crm_screen/crm_screen_event.dart';
import 'package:flutter_assignment/src/blocs/crm_screen/crm_screen_state.dart';
import 'package:flutter_assignment/utils/permission_handler.dart';
import 'package:flutter_assignment/utils/time_util.dart';
import 'package:flutter_assignment/utils/util.dart';

class CrmScreenBloc extends Bloc<CrmScreenEvent, CrmScreenState> {
  final TaskCardsDao taskCardsDao = TaskCardsDao.getInstance();

  CrmScreenBloc() : super(CrmScreenInitializing()) {
    on<InitCrmScreen>(mapEventToState);
    on<OnTaskCreate>(mapEventToState);
    on<OnItemMoved>(mapEventToState);
    on<OnTaskUpdate>(mapEventToState);
    on<ExportToCsv>(mapEventToState);
  }

  void mapEventToState(
      CrmScreenEvent event, Emitter<CrmScreenState> emit) async {
    if (event is InitCrmScreen) {
      Map<String, List<TaskCard>> data = {};
      List<TaskCard> allTaskList =
          await taskCardsDao.getDiscussionSectionList();
      for (var element in allTaskList) {
        if (data[element.status] != null) {
          List<TaskCard> list = data[element.status]!;
          list.add(element);
          data[element.status] = list;
        } else {
          List<TaskCard> list = [];
          list.add(element);
          data[element.status] = list;
        }
      }
      for (var element in CrmHeaders.values) {
        if (data[element.name] == null) {
          data[element.name] = [];
        }
      }
      emit(OnCrmScreenInitialized(data: data));
    } else if (event is OnTaskCreate) {
      if (state is OnCrmScreenInitialized) {
        TaskCard taskCard = await taskCardsDao.insertTask(
          heading: event.heading,
          body: event.body,
          createdBy: Util.getCurrentUser(),
          members: event.members,
          endTime: event.endTime,
          status: event.status,
        );

        /// Add Task in the state data
        Map<String, List<TaskCard>> data =
            (state as OnCrmScreenInitialized).data;

        if (!Util.isValidList(data[CrmHeaders.todo.name])) {
          data[CrmHeaders.todo.name] = [];
        }
        data[CrmHeaders.todo.name]!.add(taskCard);
        emit(OnCrmScreenInitialized(data: data));
      }
    } else if (event is OnItemMoved) {
      if (state is OnCrmScreenInitialized) {
        Map<String, List<TaskCard>> data =
            (state as OnCrmScreenInitialized).data;

        List<TaskCard> newList =
            data[CrmHeaders.values[event.newListIndex].name]!;

        TaskCard taskCard = data[CrmHeaders.values[event.oldListIndex].name]!
            .removeAt(event.oldItemIndex);

        /// When card move in-progress to todo
        if (taskCard.status == CrmHeaders.inProgress.name &&
            CrmHeaders.values[event.newListIndex].name ==
                CrmHeaders.todo.name) {
          if (taskCard.inProcessTime! > 0) {
            taskCard.totalTimeSpend +=
                TimeUtil.getCurrentDateTime().millisecondsSinceEpoch -
                    taskCard.inProcessTime!;
            taskCard.inProcessTime = 0;
          }
        }

        taskCard.status = CrmHeaders.values[event.newListIndex].name;

        /// When card move done
        if (taskCard.status == CrmHeaders.done.name) {
          taskCard.actualEndTime =
              TimeUtil.getCurrentDateTime().millisecondsSinceEpoch;
          if (taskCard.inProcessTime! > 0) {
            taskCard.totalTimeSpend +=
                TimeUtil.getCurrentDateTime().millisecondsSinceEpoch -
                    taskCard.inProcessTime!;
            taskCard.inProcessTime = 0;
          }
        }

        /// When card move in-progress
        if (taskCard.status == CrmHeaders.inProgress.name) {
          taskCard.inProcessTime =
              TimeUtil.getCurrentDateTime().millisecondsSinceEpoch;
        }
        newList.insert(event.newItemIndex, taskCard);

        /// Update database
        taskCardsDao.updateTaskList(
            taskId: taskCard.taskId,
            status: CrmHeaders.values[event.newListIndex].name);
        emit(OnCrmScreenInitialized(data: data));
      }
    } else if (event is OnTaskUpdate) {
      if (state is OnCrmScreenInitialized) {
        /// Update database
        taskCardsDao.updateTask(
          taskId: event.taskId,
          body: event.body,
          heading: event.heading,
          endTime: event.endTime,
          members: event.members,
        );
        add(const InitCrmScreen());
      }
    } else if (event is ExportToCsv) {
      List<TaskCard> allTaskList =
          await taskCardsDao.getDiscussionSectionList();

      if (Constant.isPermissionGranted) {
        makeCsv(allTaskList);
      } else {
        bool isGranted =
            await PermissionHandler.getInstance().checkPermissions();
        if (isGranted) {
          makeCsv(allTaskList);
        }
      }
    }
  }

  void makeCsv(List<TaskCard> allTaskList) {
    List<List<dynamic>> rows = <List<dynamic>>[];
    for (int i = 0; i < allTaskList.length; i++) {
      List<dynamic> row = [];
      row.add(allTaskList[i].heading);
      row.add(allTaskList[i].body);
      row.add(allTaskList[i].members);
      row.add(allTaskList[i].status);
      row.add(allTaskList[i].createdBy);
      rows.add(row);
    }

    try {
      String dir = "/storage/emulated/0/Download/";
      File f = File("${dir}crmSample.csv");

      String csv = const ListToCsvConverter().convert(rows);
      f.writeAsString(csv);
    } catch (_, log) {}
  }
}
