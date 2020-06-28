import 'package:mobx/mobx.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
