import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_user/app/shared/repository/user_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  UserRepository repository;

  @observable
  ObservableFuture users;

  _HomeControllerBase(this.repository);

  init() {
    users = repository.getAllUsers().asObservable();
  }
}
