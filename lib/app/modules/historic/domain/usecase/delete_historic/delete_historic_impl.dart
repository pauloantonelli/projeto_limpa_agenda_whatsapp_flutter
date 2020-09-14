import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/delete_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/delete_historic/delete_historic_historic.dart';

class DeleteHistoricImpl implements DeleteHistoric {
  final DeleteHistoricRepository _repository;

  DeleteHistoricImpl(this._repository);
  @override
  Future<Either<DeleteHistoricDataBaseError, bool>> call(HistoricEntity model) {
    return _repository.deleteHistoricoByID(model);
  }
}
