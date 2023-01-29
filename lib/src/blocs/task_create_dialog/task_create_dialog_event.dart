import 'package:flutter/widgets.dart';

@immutable
abstract class TaskCreateDialogEvent {
  const TaskCreateDialogEvent() : super();
}

class CheckButtonState extends TaskCreateDialogEvent {
  final String? heading;
  final String? body;
  final String? memberList;
  const CheckButtonState({this.heading, this.body, this.memberList});
}
