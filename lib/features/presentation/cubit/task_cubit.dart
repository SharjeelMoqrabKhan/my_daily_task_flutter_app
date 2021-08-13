import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/add_task_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/delete_task_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/get_all_task_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/get_notification_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/open_database_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/turn_off_notification_usecase.dart';
import 'package:my_daily_task_flutter_app/features/domain/usecases/update_usecase.dart';
part 'task_state.dart';
class TaskCubit extends Cubit<TaskState> {
  final AddNewTaskUsecase addNewTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final GetAllTaskUsecase getAllTaskUsecase;
  final GetNotificationUsecase getNotificationUsecase;
  final OpenDataBaseUsecase openDataBaseUsecase;
  final TurnOffNotificationUsecase turnOffNotificationUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  TaskCubit({
    this.addNewTaskUsecase,
    this.deleteTaskUsecase,
    this.getAllTaskUsecase,
    this.getNotificationUsecase,
    this.openDataBaseUsecase,
    this.turnOffNotificationUsecase,
    this.updateTaskUsecase,
  }) : super(TaskInitialState());

  Future <void> addNewTask({TaskEntity task}) async{
    try{
      await addNewTaskUsecase.call(task);
    }catch(_){
      //Fix:emit (failiure state)
    }
  }

  Future <void> deleteTask({TaskEntity task}) async{
    try{
      await deleteTaskUsecase.call(task);
    }catch(_){
      //Fix:emit (failiure state)
    }
  }


  Future <void> getAllTask() async{
    try{
      final taskData=await getAllTaskUsecase.call();
      emit(TaskLoadedlState(taskData: taskData));
    }catch(_){
     emit(TaskFailiureState());
    }
  }
    Future <void> openDatabase ({TaskEntity task}) async{
    try{
      await openDataBaseUsecase.call();
    }catch(_){
      //Fix:emit (failiure state)
    }
  }
  Future <void> getNotification ({TaskEntity task}) async{
    try{
      await getNotificationUsecase.call(task);
    }catch(_){
      //Fix:emit (failiure state)
    }
  }

  Future <void> update ({TaskEntity task}) async{
    try{
      await updateTaskUsecase.call(task);
    }catch(_){
      //Fix:emit (failiure state)
    }
  }

  Future <void> turnOffNotification ({TaskEntity task}) async{
    try{
      await turnOffNotificationUsecase.call(task);
    }catch(_){
      //Fix:emit (failiure state)
    }
  }
}
