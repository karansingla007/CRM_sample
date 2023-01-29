import 'package:flutter_assignment/databases/task_card/model/task_card.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CrmScreenState {
  const CrmScreenState([props = const []]) : super();
}

class CrmScreenInitializing extends CrmScreenState {}

class OnCrmScreenInitialized extends CrmScreenState {
  final Map<String, List<TaskCard>> data;

  const OnCrmScreenInitialized({required this.data});
}
