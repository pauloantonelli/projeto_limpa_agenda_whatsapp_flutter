import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String title;
  @observable
  String subtitle;
  @observable
  PageController controllerPage = new PageController(initialPage: 0);
}
