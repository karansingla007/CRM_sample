import 'package:meta/meta.dart';

@immutable
abstract class TaskCreateDialogState {
  const TaskCreateDialogState([props = const []]) : super();
}

class CreateButtonState extends TaskCreateDialogState {
  final bool isEnable;
  const CreateButtonState({this.isEnable = false});
}
