import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/update_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/update_historic/update_historic_historic.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/update_historic/update_historic_impl.dart';

class UpdateHistoricRepositoryMock extends Mock
    implements UpdateHistoricRepository {}

main() {
  final UpdateHistoricRepository _repository =
      new UpdateHistoricRepositoryMock();
  final UpdateHistoric usecase = new UpdateHistoricImpl(_repository);
  final updateData = new HistoricEntity(012, 994445386, 'hi world');

  group('teste da atualizacao do historico no banco de dados local', () {
    test('deve atualizar um valor no banco de dados local e retornar o status',
        () async {
      when(_repository.updateHistorico(any))
          .thenAnswer((_) async => Right(true));
      final result = await usecase(updateData);
      expect(result | null, isA<bool>());
      expect(result | null, true);
    });
  });
}
