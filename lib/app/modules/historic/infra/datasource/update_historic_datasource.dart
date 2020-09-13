import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

abstract class UpdateHistoricDatasource {
  Future<bool> updateHistorico(HistoricEntity model);
}
