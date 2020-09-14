import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/historic/datasource/sqlite/sqlite.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

class HistoricSqliteDataSourceMock extends Mock
    implements HistoricSqliteDataSource {}

main() {
  final HistoricSqliteDataSource datasource =
      new HistoricSqliteDataSourceMock();
  test(
      'deve retornar um booleano se ocorreu uma inserção no banco de dados local',
      () {
    final entitydata = new HistoricEntity(012, 994445386, 'hi world');
    when(datasource.insertNewHistorico(any))
        .thenAnswer((_) => Future.value(true));
    final result = datasource.insertNewHistorico(entitydata);
    expect(result, isA<Future<bool>>());
  });
}
