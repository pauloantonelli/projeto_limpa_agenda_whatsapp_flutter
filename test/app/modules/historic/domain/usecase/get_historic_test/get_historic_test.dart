import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/get_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/get_historic/get_historic.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/get_historic/get_historic_impl.dart';

class GetHistoricRepositoryMock extends Mock implements GetHistoricRepository {}

main() {
  final GetHistoricRepository _repository = new GetHistoricRepositoryMock();
  final GetHistoric usecase = new GetHistoricImpl(_repository);
  final dataMock = {
    "id": 'id',
    "ddd": 'ddd',
    "telefone": 'telefone',
    "mensagem": 'mensagem',
  };
  test('deve retornar o historico do banco de dados local', () async {
    when(_repository.getHistorico()).thenAnswer((_) async => Right([dataMock]));
    final result = await usecase();

    expect(result | null, isA<List<Map<String, dynamic>>>());
    expect(result.fold((l) => l, (r) => r), [dataMock]);
  });
}
