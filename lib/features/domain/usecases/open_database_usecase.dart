import 'package:my_daily_task_flutter_app/features/domain/repo/local_repo.dart';
import 'package:sembast/sembast.dart';

class OpenDataBaseUsecase {
  final LocalRepository localRepository;
  OpenDataBaseUsecase({this.localRepository});

  Future<Database> call() {
    return localRepository.openDataBase();
  }
}
