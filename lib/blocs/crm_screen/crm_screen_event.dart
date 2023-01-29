import 'package:flutter/widgets.dart';

@immutable
abstract class CrmScreenEvent {
  const CrmScreenEvent() : super();
}

class InitCrmScreen extends CrmScreenEvent {
  const InitCrmScreen();
}

class OnTaskCreate extends CrmScreenEvent {
  final String heading;
  final String body;
  final int endTime;
  final String members;
  final String status;

  const OnTaskCreate({
    required this.heading,
    required this.body,
    required this.endTime,
    required this.members,
    required this.status,
  });
}

class OnTaskUpdate extends CrmScreenEvent {
  final String heading;
  final String body;
  final int endTime;
  final String members;
  final int taskId;

  const OnTaskUpdate({
    required this.heading,
    required this.body,
    required this.endTime,
    required this.members,
    required this.taskId,
  });
}

class OnItemMoved extends CrmScreenEvent {
  final int oldItemIndex;
  final int oldListIndex;
  final int newItemIndex;
  final int newListIndex;

  const OnItemMoved(
      {required this.oldItemIndex,
      required this.oldListIndex,
      required this.newItemIndex,
      required this.newListIndex});
}

class ExportToCsv extends CrmScreenEvent {
  const ExportToCsv();
}
