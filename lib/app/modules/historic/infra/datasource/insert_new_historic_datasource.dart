import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

abstract class InsertNewHistoricDatasource {
  Future<int> insertNewHistorico(HistoricEntity model);
}
