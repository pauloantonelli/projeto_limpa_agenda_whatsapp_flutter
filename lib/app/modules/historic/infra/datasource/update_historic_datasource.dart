import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

abstract class UpdateHistoricDatasource {
  Future<int> updateHistorico(HistoricEntity model);
}
