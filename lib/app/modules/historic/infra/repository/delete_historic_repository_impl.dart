import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/delete_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/delete_historic_datasource.dart';

class DeleteHistoricRepositoryImpl implements DeleteHistoricRepository {
  final DeleteHistoricDatasource _datasource;

  DeleteHistoricRepositoryImpl(this._datasource);

  @override
  Future<Either<DeleteHistoricDataBaseError, bool>> deleteHistoricoByID(
      HistoricEntity model) async {
    final result = await _datasource.deleteHistoricoByID(model);
    return Right(result);
  }
}
