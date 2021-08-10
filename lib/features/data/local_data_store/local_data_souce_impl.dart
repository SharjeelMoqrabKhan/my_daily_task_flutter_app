import 'dart:async';
import 'package:my_daily_task_flutter_app/features/data/local_data_store/local_data_source.dart';
import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

const String MAP_STORE = "MAP_STORE_TASK";
class LocalDataSourceImplement implements LocalDataSouce {

  Future<Database> get db async => _dbOpenCompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);


  Completer<Database> _dbOpenCompleter;
  Future _initDatabase() async {
    final appDocumentDir= await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path,"task.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
    }
    
      @override
      Future<void> addNewTask(TaskEntity task) {
        throw UnimplementedError();
      }
    
      @override
      Future<void> deleteTask(TaskEntity task) {
        throw UnimplementedError();
      }
    
      @override
      Future<void> getAllTask() {
        throw UnimplementedError();
      }
    
      @override
      Future<void> getNotificationTask(TaskEntity task) {
        throw UnimplementedError();
      }
    
      @override
      Future<Database> openDataBase() {
        if(_dbOpenCompleter == null){
          _dbOpenCompleter = Completer();
          _initDatabase();
        }
        return _dbOpenCompleter.future;
      }
    
      @override
      Future<void> turnOffNotificationTask(TaskEntity task) {
        throw UnimplementedError();
      }
    
      @override
      Future<void> updateTask(TaskEntity task) {
        throw UnimplementedError();
      }
    
      
}
