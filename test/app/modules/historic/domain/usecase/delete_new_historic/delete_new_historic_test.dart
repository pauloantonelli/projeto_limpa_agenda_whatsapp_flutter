import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/delete_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/delete_historic/delete_historic_historic.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/delete_historic/delete_historic_impl.dart';

class DeleteHistoricRepositoryMock extends Mock
    implements DeleteHistoricRepository {}

main() {
  final DeleteHistoricRepository _repository =
      new DeleteHistoricRepositoryMock();
  final DeleteHistoric usecase = new DeleteHistoricImpl(_repository);
  final deleteData = new HistoricEntity(012, 994445386, 'hi world');

  group('teste deleção de um registro do historico no banco de dados local',
      () {
    test('deve deletar um valor no banco de dados local e retornar o status',
        () async {
      when(_repository.deleteHistoricoByID(any))
          .thenAnswer((_) async => Right(true));
      final result = await usecase(deleteData);
      expect(result | null, isA<bool>());
      expect(result | null, true);
    });
  });
}
