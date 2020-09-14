import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/get_historic_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/get_historic_datasource.dart';

class GetHistoricRepositoryImpl implements GetHistoricRepository {
  final GetHistoricDatasource _datasource;

  GetHistoricRepositoryImpl(this._datasource);

  @override
  Future<Either<GetHistoricDataBaseError, List<Map<String, dynamic>>>>
      getHistorico() async {
    final result = await _datasource.getDataFromDataBase();
    return Right(result);
  }
}
