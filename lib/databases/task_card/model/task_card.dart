class TaskCard {
  int taskId;
  int createdAt;
  String createdBy;
  String heading;
  String body;
  int endTime;
  int? actualEndTime;
  int totalTimeSpend;
  int? inProcessTime;
  String members;
  String status;

  TaskCard({
    required this.taskId,
    required this.createdAt,
    required this.createdBy,
    required this.heading,
    required this.body,
    required this.endTime,
    this.actualEndTime,
    required this.members,
    required this.status,
    this.inProcessTime,
    this.totalTimeSpend = 0,
  });
}
