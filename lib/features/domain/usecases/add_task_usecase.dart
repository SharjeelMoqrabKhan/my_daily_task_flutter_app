import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';

class AddNewTaskUsecase{
final LocalRepository localRepository;
AddNewTaskUsecase({this.localRepository}); 

Future <void> call(TaskEntity task){
  return localRepository.addNewTask(task);
}
}