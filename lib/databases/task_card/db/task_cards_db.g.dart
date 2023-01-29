// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_cards_db.dart';

// ignore_for_file: type=lint
class $TaskCardTable extends TaskCard with TableInfo<$TaskCardTable, taskCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskCardTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().millisecondsSinceEpoch));
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _headingMeta =
      const VerificationMeta('heading');
  @override
  late final GeneratedColumn<String> heading = GeneratedColumn<String>(
      'heading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actualEndTimeMeta =
      const VerificationMeta('actualEndTime');
  @override
  late final GeneratedColumn<int> actualEndTime = GeneratedColumn<int>(
      'actual_end_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _membersMeta =
      const VerificationMeta('members');
  @override
  late final GeneratedColumn<String> members = GeneratedColumn<String>(
      'members', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalTimeSpendMeta =
      const VerificationMeta('totalTimeSpend');
  @override
  late final GeneratedColumn<int> totalTimeSpend = GeneratedColumn<int>(
      'total_time_spend', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _inProcessTimeMeta =
      const VerificationMeta('inProcessTime');
  @override
  late final GeneratedColumn<int> inProcessTime = GeneratedColumn<int>(
      'in_process_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        taskId,
        createdAt,
        createdBy,
        heading,
        body,
        endTime,
        actualEndTime,
        members,
        status,
        totalTimeSpend,
        inProcessTime
      ];
  @override
  String get aliasedName => _alias ?? 'task_card';
  @override
  String get actualTableName => 'task_card';
  @override
  VerificationContext validateIntegrity(Insertable<taskCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('heading')) {
      context.handle(_headingMeta,
          heading.isAcceptableOrUnknown(data['heading']!, _headingMeta));
    } else if (isInserting) {
      context.missing(_headingMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('actual_end_time')) {
      context.handle(
          _actualEndTimeMeta,
          actualEndTime.isAcceptableOrUnknown(
              data['actual_end_time']!, _actualEndTimeMeta));
    }
    if (data.containsKey('members')) {
      context.handle(_membersMeta,
          members.isAcceptableOrUnknown(data['members']!, _membersMeta));
    } else if (isInserting) {
      context.missing(_membersMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('total_time_spend')) {
      context.handle(
          _totalTimeSpendMeta,
          totalTimeSpend.isAcceptableOrUnknown(
              data['total_time_spend']!, _totalTimeSpendMeta));
    }
    if (data.containsKey('in_process_time')) {
      context.handle(
          _inProcessTimeMeta,
          inProcessTime.isAcceptableOrUnknown(
              data['in_process_time']!, _inProcessTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskId};
  @override
  taskCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return taskCard(
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      heading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}heading'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
      actualEndTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_end_time']),
      members: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}members'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      totalTimeSpend: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_time_spend'])!,
      inProcessTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}in_process_time']),
    );
  }

  @override
  $TaskCardTable createAlias(String alias) {
    return $TaskCardTable(attachedDatabase, alias);
  }
}

class taskCard extends DataClass implements Insertable<taskCard> {
  final int taskId;
  final int createdAt;
  final String createdBy;
  final String heading;
  final String body;
  final int endTime;
  final int? actualEndTime;
  final String members;
  final String status;
  final int totalTimeSpend;
  final int? inProcessTime;
  const taskCard(
      {required this.taskId,
      required this.createdAt,
      required this.createdBy,
      required this.heading,
      required this.body,
      required this.endTime,
      this.actualEndTime,
      required this.members,
      required this.status,
      required this.totalTimeSpend,
      this.inProcessTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_id'] = Variable<int>(taskId);
    map['created_at'] = Variable<int>(createdAt);
    map['created_by'] = Variable<String>(createdBy);
    map['heading'] = Variable<String>(heading);
    map['body'] = Variable<String>(body);
    map['end_time'] = Variable<int>(endTime);
    if (!nullToAbsent || actualEndTime != null) {
      map['actual_end_time'] = Variable<int>(actualEndTime);
    }
    map['members'] = Variable<String>(members);
    map['status'] = Variable<String>(status);
    map['total_time_spend'] = Variable<int>(totalTimeSpend);
    if (!nullToAbsent || inProcessTime != null) {
      map['in_process_time'] = Variable<int>(inProcessTime);
    }
    return map;
  }

  TaskCardCompanion toCompanion(bool nullToAbsent) {
    return TaskCardCompanion(
      taskId: Value(taskId),
      createdAt: Value(createdAt),
      createdBy: Value(createdBy),
      heading: Value(heading),
      body: Value(body),
      endTime: Value(endTime),
      actualEndTime: actualEndTime == null && nullToAbsent
          ? const Value.absent()
          : Value(actualEndTime),
      members: Value(members),
      status: Value(status),
      totalTimeSpend: Value(totalTimeSpend),
      inProcessTime: inProcessTime == null && nullToAbsent
          ? const Value.absent()
          : Value(inProcessTime),
    );
  }

  factory taskCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return taskCard(
      taskId: serializer.fromJson<int>(json['taskId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      heading: serializer.fromJson<String>(json['heading']),
      body: serializer.fromJson<String>(json['body']),
      endTime: serializer.fromJson<int>(json['endTime']),
      actualEndTime: serializer.fromJson<int?>(json['actualEndTime']),
      members: serializer.fromJson<String>(json['members']),
      status: serializer.fromJson<String>(json['status']),
      totalTimeSpend: serializer.fromJson<int>(json['totalTimeSpend']),
      inProcessTime: serializer.fromJson<int?>(json['inProcessTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskId': serializer.toJson<int>(taskId),
      'createdAt': serializer.toJson<int>(createdAt),
      'createdBy': serializer.toJson<String>(createdBy),
      'heading': serializer.toJson<String>(heading),
      'body': serializer.toJson<String>(body),
      'endTime': serializer.toJson<int>(endTime),
      'actualEndTime': serializer.toJson<int?>(actualEndTime),
      'members': serializer.toJson<String>(members),
      'status': serializer.toJson<String>(status),
      'totalTimeSpend': serializer.toJson<int>(totalTimeSpend),
      'inProcessTime': serializer.toJson<int?>(inProcessTime),
    };
  }

  taskCard copyWith(
          {int? taskId,
          int? createdAt,
          String? createdBy,
          String? heading,
          String? body,
          int? endTime,
          Value<int?> actualEndTime = const Value.absent(),
          String? members,
          String? status,
          int? totalTimeSpend,
          Value<int?> inProcessTime = const Value.absent()}) =>
      taskCard(
        taskId: taskId ?? this.taskId,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        heading: heading ?? this.heading,
        body: body ?? this.body,
        endTime: endTime ?? this.endTime,
        actualEndTime:
            actualEndTime.present ? actualEndTime.value : this.actualEndTime,
        members: members ?? this.members,
        status: status ?? this.status,
        totalTimeSpend: totalTimeSpend ?? this.totalTimeSpend,
        inProcessTime:
            inProcessTime.present ? inProcessTime.value : this.inProcessTime,
      );
  @override
  String toString() {
    return (StringBuffer('taskCard(')
          ..write('taskId: $taskId, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('heading: $heading, ')
          ..write('body: $body, ')
          ..write('endTime: $endTime, ')
          ..write('actualEndTime: $actualEndTime, ')
          ..write('members: $members, ')
          ..write('status: $status, ')
          ..write('totalTimeSpend: $totalTimeSpend, ')
          ..write('inProcessTime: $inProcessTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(taskId, createdAt, createdBy, heading, body,
      endTime, actualEndTime, members, status, totalTimeSpend, inProcessTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is taskCard &&
          other.taskId == this.taskId &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy &&
          other.heading == this.heading &&
          other.body == this.body &&
          other.endTime == this.endTime &&
          other.actualEndTime == this.actualEndTime &&
          other.members == this.members &&
          other.status == this.status &&
          other.totalTimeSpend == this.totalTimeSpend &&
          other.inProcessTime == this.inProcessTime);
}

class TaskCardCompanion extends UpdateCompanion<taskCard> {
  final Value<int> taskId;
  final Value<int> createdAt;
  final Value<String> createdBy;
  final Value<String> heading;
  final Value<String> body;
  final Value<int> endTime;
  final Value<int?> actualEndTime;
  final Value<String> members;
  final Value<String> status;
  final Value<int> totalTimeSpend;
  final Value<int?> inProcessTime;
  const TaskCardCompanion({
    this.taskId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.heading = const Value.absent(),
    this.body = const Value.absent(),
    this.endTime = const Value.absent(),
    this.actualEndTime = const Value.absent(),
    this.members = const Value.absent(),
    this.status = const Value.absent(),
    this.totalTimeSpend = const Value.absent(),
    this.inProcessTime = const Value.absent(),
  });
  TaskCardCompanion.insert({
    this.taskId = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String createdBy,
    required String heading,
    required String body,
    required int endTime,
    this.actualEndTime = const Value.absent(),
    required String members,
    required String status,
    this.totalTimeSpend = const Value.absent(),
    this.inProcessTime = const Value.absent(),
  })  : createdBy = Value(createdBy),
        heading = Value(heading),
        body = Value(body),
        endTime = Value(endTime),
        members = Value(members),
        status = Value(status);
  static Insertable<taskCard> custom({
    Expression<int>? taskId,
    Expression<int>? createdAt,
    Expression<String>? createdBy,
    Expression<String>? heading,
    Expression<String>? body,
    Expression<int>? endTime,
    Expression<int>? actualEndTime,
    Expression<String>? members,
    Expression<String>? status,
    Expression<int>? totalTimeSpend,
    Expression<int>? inProcessTime,
  }) {
    return RawValuesInsertable({
      if (taskId != null) 'task_id': taskId,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (heading != null) 'heading': heading,
      if (body != null) 'body': body,
      if (endTime != null) 'end_time': endTime,
      if (actualEndTime != null) 'actual_end_time': actualEndTime,
      if (members != null) 'members': members,
      if (status != null) 'status': status,
      if (totalTimeSpend != null) 'total_time_spend': totalTimeSpend,
      if (inProcessTime != null) 'in_process_time': inProcessTime,
    });
  }

  TaskCardCompanion copyWith(
      {Value<int>? taskId,
      Value<int>? createdAt,
      Value<String>? createdBy,
      Value<String>? heading,
      Value<String>? body,
      Value<int>? endTime,
      Value<int?>? actualEndTime,
      Value<String>? members,
      Value<String>? status,
      Value<int>? totalTimeSpend,
      Value<int?>? inProcessTime}) {
    return TaskCardCompanion(
      taskId: taskId ?? this.taskId,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      heading: heading ?? this.heading,
      body: body ?? this.body,
      endTime: endTime ?? this.endTime,
      actualEndTime: actualEndTime ?? this.actualEndTime,
      members: members ?? this.members,
      status: status ?? this.status,
      totalTimeSpend: totalTimeSpend ?? this.totalTimeSpend,
      inProcessTime: inProcessTime ?? this.inProcessTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (heading.present) {
      map['heading'] = Variable<String>(heading.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (actualEndTime.present) {
      map['actual_end_time'] = Variable<int>(actualEndTime.value);
    }
    if (members.present) {
      map['members'] = Variable<String>(members.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (totalTimeSpend.present) {
      map['total_time_spend'] = Variable<int>(totalTimeSpend.value);
    }
    if (inProcessTime.present) {
      map['in_process_time'] = Variable<int>(inProcessTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCardCompanion(')
          ..write('taskId: $taskId, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('heading: $heading, ')
          ..write('body: $body, ')
          ..write('endTime: $endTime, ')
          ..write('actualEndTime: $actualEndTime, ')
          ..write('members: $members, ')
          ..write('status: $status, ')
          ..write('totalTimeSpend: $totalTimeSpend, ')
          ..write('inProcessTime: $inProcessTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$TaskCardsDatabase extends GeneratedDatabase {
  _$TaskCardsDatabase(QueryExecutor e) : super(e);
  late final $TaskCardTable taskCard = $TaskCardTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskCard];
}
