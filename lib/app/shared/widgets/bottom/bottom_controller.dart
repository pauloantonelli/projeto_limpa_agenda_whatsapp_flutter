import 'package:mobx/mobx.dart';

part 'bottom_controller.g.dart';

class BottomController = _BottomControllerBase with _$BottomController;

abstract class _BottomControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
