import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';

class OpenDataBase {
  final LocalRepository localRepository;
  OpenDataBase({this.localRepository});

  Future<void> call() {
    return localRepository.openDataBase();
  }
}
