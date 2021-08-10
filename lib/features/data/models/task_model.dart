import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int id,
    final String title,
    final String colorIndex,
    final String time,
    final bool isCompletedTask,
    final bool notification,
    final String taskType
  }) : super(
          colorIndex: colorIndex,
          title: title,
          time: time,
          isCompletedTask: isCompletedTask,
          notification: notification,
          taskType:taskType,
        );


  // Dabase data fatching 
  static TaskModel formJson(Map<String, dynamic> json) {
    return TaskModel(
      colorIndex: json['colorIndex'],
      time: json['time'],
      isCompletedTask: json['isCompletedTask'],
      notification: json['notification'],
      title: json['title'],
      taskType: json['taskType']
    );
  }

  // Dabase data sending 
  Map<String,dynamic> toJson(){
    return{
      "time":time,
      "title":title,
      "colorIndex":colorIndex,
      "notification":notification,
      "isCompletedTask":isCompletedTask,
       "taskType": taskType
    };
  }
}
