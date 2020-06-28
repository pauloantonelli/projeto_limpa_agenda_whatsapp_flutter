import 'package:mobx/mobx.dart';

part 'top_controller.g.dart';

class TopController = _TopControllerBase with _$TopController;

abstract class _TopControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
