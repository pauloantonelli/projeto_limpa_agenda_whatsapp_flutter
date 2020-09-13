import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

abstract class DeleteHistoricDatasource {
  Future<bool> deleteHistoricoByID(HistoricEntity model);
}
