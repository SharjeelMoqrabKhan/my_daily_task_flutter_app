/* Task state contains the states of application
 * intial state,failure state,loading state,success state
 */


part of 'task_cubit.dart';
abstract class TaskState extends Equatable{
  const TaskState();
}

class TaskInitialState extends TaskState{
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskState{
  @override
  List<Object> get props => [];
}

class TaskLoadedlState extends TaskState{
 final List <TaskEntity> taskData;
  TaskLoadedlState({this.taskData});
  @override
  List<Object> get props => [];
}

class TaskFailiureState extends TaskState{
  @override
  List<Object> get props => throw UnimplementedError();

}