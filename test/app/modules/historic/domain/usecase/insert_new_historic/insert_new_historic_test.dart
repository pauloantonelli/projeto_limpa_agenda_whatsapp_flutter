import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/insert_new_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/insert_new_historic/insert_new_historic.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/insert_new_historic/insert_new_historic_impl.dart';

class InsertNewHistoricRepositoryMock extends Mock
    implements InsertNewHistoricRepository {}

main() {
  final InsertNewHistoricRepository _repository =
      new InsertNewHistoricRepositoryMock();
  final InsertNewHistoric usecase = new InsertNewHistoricImpl(_repository);
  final insertData = new HistoricEntity(011, 983334275, 'olá mundo');

  group('teste da inserção do historico no banco de dados local', () {
    test('deve inserir um valor no banco de dados local e retornar o status',
        () async {
      when(_repository.insertNewHistorico(any))
          .thenAnswer((_) async => Right(true));
      final result = await usecase(insertData);
      expect(result | null, isA<bool>());
      expect(result | null, true);
    });
  });
}
