import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/update_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/update_historic/update_historic_historic.dart';

class UpdateHistoricImpl implements UpdateHistoric {
  final UpdateHistoricRepository _repository;

  UpdateHistoricImpl(this._repository);
  @override
  Future<Either<UpdateHistoricDataBaseError, bool>> call(HistoricEntity model) {
    return _repository.updateHistorico(model);
  }
}
