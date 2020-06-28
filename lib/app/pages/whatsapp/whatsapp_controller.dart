import 'package:mobx/mobx.dart';

part 'whatsapp_controller.g.dart';

class WhatsappController = _WhatsappControllerBase with _$WhatsappController;

abstract class _WhatsappControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
