import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/insert_new_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/insert_new_historic_datasource.dart';

class InsertNewHistoricRepositoryImpl implements InsertNewHistoricRepository {
  final InsertNewHistoricDatasource _datasource;

  InsertNewHistoricRepositoryImpl(this._datasource);

  @override
  Future<Either<InsertHistoricDataBaseError, bool>> insertNewHistorico(
      HistoricEntity model) async {
    final result = await _datasource.insertNewHistorico(model);
    return Right(result);
  }
}
