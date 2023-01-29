import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_assignment/databases/task_card/tables/task_card.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'task_cards_db.g.dart';

@DriftDatabase(tables: [TaskCard])
class TaskCardsDatabase extends _$TaskCardsDatabase {
  // we tell the database where to store the data with this constructor
  TaskCardsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    String path = p.join(dbFolder.path, 'task_cards.sqlite');

    final file = File(path);
    return NativeDatabase(
      file,
    );
  });
}
