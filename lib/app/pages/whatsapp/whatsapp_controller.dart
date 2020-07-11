import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'whatsapp_controller.g.dart';

class WhatsappController = _WhatsappControllerBase with _$WhatsappController;

abstract class _WhatsappControllerBase with Store {
  @observable
  TextEditingController formText = new TextEditingController();

  @action
  void increment() {}
}
