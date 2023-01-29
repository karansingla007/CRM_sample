import 'package:drift/src/runtime/data_class.dart';
import 'package:flutter_assignment/constants/strings.dart';
import 'package:flutter_assignment/databases/task_card/db/task_cards_db.dart';
import 'package:flutter_assignment/databases/task_card/model/task_card.dart';
import 'package:flutter_assignment/utils/time_util.dart';

class TaskCardsDao {
  // this constructor is required so  the main database can create an instance
  // of this object.that

  TaskCardsDao._();

  static late TaskCardsDao _instance;

  static TaskCardsDao getInstance() {
    _instance = TaskCardsDao._();
    return _instance;
  }

  final database = TaskCardsDatabase();

  Future<List<TaskCard>> getDiscussionSectionList() async {
    List<TaskCard> taskCards = [];

    for (var element in (await database.select(database.taskCard).get())) {
      TaskCard taskCard = TaskCard(
        taskId: element.taskId,
        createdAt: element.createdAt,
        createdBy: element.createdBy,
        heading: element.heading,
        body: element.body,
        endTime: element.endTime,
        members: element.members,
        status: element.status,
        actualEndTime: element.actualEndTime,
        totalTimeSpend: element.totalTimeSpend,
        inProcessTime: element.inProcessTime,
      );
      taskCards.add(taskCard);
    }
    return taskCards;
  }

  Future<TaskCard> insertTask({
    required String createdBy,
    required String heading,
    required String body,
    required String members,
    required String status,
    required int endTime,
  }) async {
    int id =
        await database.into(database.taskCard).insert(TaskCardCompanion.insert(
              createdBy: createdBy,
              heading: heading,
              body: body,
              endTime: endTime,
              members: members,
              status: status,
            ));
    var detail = await (database.select(database.taskCard)
          ..where((t) => t.taskId.equals(id)))
        .get();

    TaskCard taskCard = TaskCard(
        taskId: id,
        createdAt: detail[0].createdAt,
        createdBy: createdBy,
        heading: heading,
        body: body,
        endTime: endTime,
        members: members,
        status: status);
    return taskCard;
  }

  Future<void> updateTaskList({
    required int taskId,
    required String status,
  }) async {
    if (status == CrmHeaders.done.name) {
      taskCard data = (await (database.select(database.taskCard)
                ..where((tbl) => tbl.taskId.equals(taskId)))
              .get())
          .first;

      int actualDateTime = TimeUtil.getCurrentDateTime().millisecondsSinceEpoch;
      int totalTimeSpend = data.totalTimeSpend;
      if (data.inProcessTime! > 0) {
        totalTimeSpend = totalTimeSpend +
            (TimeUtil.getCurrentDateTime().millisecondsSinceEpoch -
                data.inProcessTime!);
      }
      (database.update(database.taskCard)
            ..where((t) => t.taskId.equals(taskId)))
          .write(TaskCardCompanion(
        status: Value(status),
        actualEndTime: Value(actualDateTime),
        totalTimeSpend: Value(totalTimeSpend),
        inProcessTime: const Value(0),
      ));
    } else if (status == CrmHeaders.inProgress.name) {
      (database.update(database.taskCard)
            ..where((t) => t.taskId.equals(taskId)))
          .write(TaskCardCompanion(
        status: Value(status),
        inProcessTime:
            Value(TimeUtil.getCurrentDateTime().millisecondsSinceEpoch),
      ));
    } else {
      taskCard data = (await (database.select(database.taskCard)
                ..where((tbl) => tbl.taskId.equals(taskId)))
              .get())
          .first;

      if (data.status == CrmHeaders.inProgress.name) {
        int totalTimeSpend = data.totalTimeSpend;
        if (data.inProcessTime! > 0) {
          totalTimeSpend = totalTimeSpend +
              (TimeUtil.getCurrentDateTime().millisecondsSinceEpoch -
                  data.inProcessTime!);
        }
        (database.update(database.taskCard)
              ..where((t) => t.taskId.equals(taskId)))
            .write(TaskCardCompanion(
          status: Value(status),
          inProcessTime: const Value(0),
          totalTimeSpend: Value(totalTimeSpend),
        ));
      } else {
        (database.update(database.taskCard)
              ..where((t) => t.taskId.equals(taskId)))
            .write(TaskCardCompanion(
          status: Value(status),
        ));
      }
    }
  }

  Future<void> updateTask({
    required int taskId,
    required String heading,
    required String body,
    required String members,
    required int endTime,
  }) async {
    (database.update(database.taskCard)..where((t) => t.taskId.equals(taskId)))
        .write(TaskCardCompanion(
      heading: Value(heading),
      body: Value(body),
      endTime: Value(endTime),
      members: Value(members),
    ));
  }
}
