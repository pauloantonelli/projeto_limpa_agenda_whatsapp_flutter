import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/update_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/update_historic_datasource.dart';

class UpdateHistoricRepositoryImpl implements UpdateHistoricRepository {
  final UpdateHistoricDatasource _datasource;

  UpdateHistoricRepositoryImpl(this._datasource);

  @override
  Future<Either<UpdateHistoricDataBaseError, Future<int>>> updateHistorico(
      HistoricEntity model) async {
    final result = _datasource.updateHistorico(model);
    return Right(result);
  }
}
