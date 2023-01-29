import 'package:drift/drift.dart';

@DataClassName('taskCard')
class TaskCard extends Table {
  IntColumn get taskId => integer().autoIncrement()();
  IntColumn get createdAt =>
      integer().withDefault(Constant(DateTime.now().millisecondsSinceEpoch))();
  TextColumn get createdBy => text()();
  TextColumn get heading => text()();
  TextColumn get body => text()();
  IntColumn get endTime => integer()();
  IntColumn get actualEndTime => integer().nullable()();
  TextColumn get members => text()();
  TextColumn get status => text()();
  IntColumn get totalTimeSpend => integer().withDefault(const Constant(0))();
  IntColumn get inProcessTime => integer().nullable()();
}
