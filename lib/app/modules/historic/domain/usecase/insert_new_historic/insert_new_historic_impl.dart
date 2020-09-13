import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/insert_new_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/insert_new_historic/insert_new_historic.dart';

class InsertNewHistoricImpl implements InsertNewHistoric {
  final InsertNewHistoricRepository _repository;

  InsertNewHistoricImpl(this._repository);
  @override
  Future<Either<InsertHistoricDataBaseError, bool>> call(HistoricEntity model) {
    final insertHistorico = _repository.insertNewHistorico(model);
    return insertHistorico;
  }
}
