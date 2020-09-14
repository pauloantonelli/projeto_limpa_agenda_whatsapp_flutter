import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/delete_historic/delete_historic_impl.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/get_historic/get_historic_impl.dart';
import 'package:mobx/mobx.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  final GetHistoricImpl usecaseGetHistoric;
  final DeleteHistoricImpl usecaseDeleteHistoric;
  @observable
  List<Map<String, dynamic>> historico = new List<Map<String, dynamic>>();

  _HistoricControllerBase(this.usecaseGetHistoric, this.usecaseDeleteHistoric);

  @action
  getDataFromDataBase() async {
    final result = await usecaseGetHistoric();
    this.historico = result.fold((l) => null, (r) => r);
  }

  setDelete(id) async {
    final model = new HistoricEntity(null, null, '', id: id);
    final result = await usecaseDeleteHistoric(model);
    return result;
  }
}
