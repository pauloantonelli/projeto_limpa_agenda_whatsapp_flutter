import 'package:mobx/mobx.dart';

part 'link-button_controller.g.dart';

class LinkButtonController = _LinkButtonControllerBase
    with _$LinkButtonController;

abstract class _LinkButtonControllerBase with Store {
  @observable
  int pageIndex;
}
