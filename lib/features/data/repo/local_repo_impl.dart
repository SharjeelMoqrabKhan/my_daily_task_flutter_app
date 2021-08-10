import 'package:my_daily_task_flutter_app/features/data/local_data_store/local_data_source.dart';
import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';
import 'package:sembast/sembast.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSouce localDataSouce;

  LocalRepositoryImpl({this.localDataSouce});

  @override
  Future<void> addNewTask(TaskEntity task) async =>
      localDataSouce.addNewTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) => localDataSouce.deleteTask(task);

  @override
  Future<void> getAllTask() => localDataSouce.getAllTask();

  @override
  Future<void> getNotificationTask(TaskEntity task) =>
      localDataSouce.getNotificationTask(task);

  @override
  Future<Database> openDataBase() => localDataSouce.openDataBase();

  @override
  Future<void> turnOffNotificationTask(TaskEntity task) =>
      localDataSouce.turnOffNotificationTask(task);

  @override
  Future<void> updateTask(TaskEntity task) => localDataSouce.updateTask(task);
}
