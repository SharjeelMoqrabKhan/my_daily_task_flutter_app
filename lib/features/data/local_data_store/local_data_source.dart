import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:sembast/sembast.dart';

abstract class LocalDataSouce {
  Future<void> addNewTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getNotificationTask(TaskEntity task);
  Future<void> turnOffNotificationTask(TaskEntity task);
  Future<List<TaskEntity>> getAllTask();
  Future<Database> openDataBase();
}
