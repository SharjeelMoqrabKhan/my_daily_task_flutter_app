import 'package:my_daily_task_flutter_app/features/domain/entities/entity.dart';
import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';

class GetAllTask {
  final LocalRepository localRepository;
  GetAllTask({this.localRepository});

  Future<List<TaskEntity>> call() {
    return localRepository.getAllTask();
  }
}
