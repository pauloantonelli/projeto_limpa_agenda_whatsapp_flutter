import 'package:mobx/mobx.dart';

part 'card-fundo_controller.g.dart';

class CardFundoController = _CardFundoControllerBase with _$CardFundoController;

abstract class _CardFundoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
