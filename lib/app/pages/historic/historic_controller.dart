import 'package:whatsapp_agenda/app/shared/utils/sqlite.dart';
import 'package:mobx/mobx.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store, Sqlite {
  @observable
  List<Map<String, dynamic>> historico = new List<Map<String, dynamic>>();

  @action
  getDataFromDataBase() {
    Sqlite().getHistorico().then((value) => this.historico = value);
  }
}
