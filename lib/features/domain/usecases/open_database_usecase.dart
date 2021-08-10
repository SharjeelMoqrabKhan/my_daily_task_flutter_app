import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';
import 'package:sembast/sembast.dart';

class OpenDataBase {
  final LocalRepository localRepository;
  OpenDataBase({this.localRepository});

  Future<Database> call() {
    return localRepository.openDataBase();
  }
}
