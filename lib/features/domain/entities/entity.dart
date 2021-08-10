class TaskEntity {
  int id;
  final String title;
  final String colorIndex;
  final String time;
  final bool isCompletedTask;
  final String notification;
  final String taskType;
  TaskEntity({
    this.title,
    this.colorIndex,
    this.time,
    this.isCompletedTask,
    this.notification,
    this.taskType
  });
}
