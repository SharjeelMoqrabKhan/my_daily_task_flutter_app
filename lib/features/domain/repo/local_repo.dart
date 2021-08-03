import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';

abstract class LocalRepository {
  Future<void> addNewTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getNotificationTask(TaskEntity task);
  Future<void> turnOffNotificationTask(TaskEntity task);
  Future<void> getAllTask();
  Future<void> openDataBase();
}
