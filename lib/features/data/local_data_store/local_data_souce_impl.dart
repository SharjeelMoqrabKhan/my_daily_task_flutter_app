import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_daily_task_flutter_app/features/data/local_data_store/local_data_source.dart';
import 'package:my_daily_task_flutter_app/features/data/models/task_model.dart';
import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImplement implements LocalDataSouce {
  Future<Database> get _db async => _dbOpenCompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Completer<Database> _dbOpenCompleter;
  Future _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, "task.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }

  @override
  Future<void> addNewTask(TaskEntity task) async {
    final newTask = TaskModel(
            time: task.time,
            colorIndex: task.colorIndex,
            isCompletedTask: task.isCompletedTask,
            notification: task.notification,
            taskType: task.taskType,
            title: task.title)
        .toJson();
    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(
      filter: Filter.byKey(task.id),
    );
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTask() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);
    final recordSnapshots = await _taskStore.find(await _db, finder: finder);
    return recordSnapshots.map((task) {
      final taskData = TaskModel.formJson(task.value);
      taskData.id = task.key;
      return taskData;
    }).toList();
  }

  @override
  Future<void> getNotificationTask(TaskEntity task) async {
    if (task.notification == false) {
      final date = DateTime.parse(task.time);
      final andoridChannel = AndroidNotificationDetails(
        task.id.toString(),
        "Daily Task Notification",
        "Daily Task Notification",
        icon: "@mipmap/ic_launcer",
        largeIcon: DrawableResourceAndroidBitmap(
          "@mipmap/ic_launcer",
        ),
      );
      final iOSChannel = IOSNotificationDetails();
      final notificaionDetails =
          NotificationDetails(android: andoridChannel, iOS: iOSChannel);
      flutterLocalNotificationsPlugin.showDailyAtTime(
        task.id,
        task.title,
        "it's time for ${task.title}",
        Time(date.hour,date.minute,date.second),
        notificaionDetails,
      );
    } else {
      flutterLocalNotificationsPlugin.cancel(task.id);
    }
  }

  @override
  Future<Database> openDataBase() {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _initDatabase();
    }
    return _dbOpenCompleter.future;
  }

  @override
  Future<void> turnOffNotificationTask(TaskEntity task) async {
    final newTask = TaskModel(
            time: task.time,
            colorIndex: task.colorIndex,
            isCompletedTask: task.isCompletedTask,
            notification: task.notification == true ? false : true,
            taskType: task.taskType,
            title: task.title)
        .toJson();
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final newTask = TaskModel(
            time: task.time,
            colorIndex: task.colorIndex,
            isCompletedTask: task.isCompletedTask == true ? false : true,
            notification: task.notification,
            taskType: task.taskType,
            title: task.title)
        .toJson();
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }
}
