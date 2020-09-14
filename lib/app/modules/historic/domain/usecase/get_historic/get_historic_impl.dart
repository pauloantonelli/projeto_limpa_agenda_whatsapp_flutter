import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/repository/get_historic_repository.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/get_historic/get_historic.dart';

class GetHistoricImpl implements GetHistoric {
  final GetHistoricRepository _repository;

  GetHistoricImpl(this._repository);
  @override
  Future<Either<GetHistoricDataBaseError, List<Map<String, dynamic>>>>
      call() async {
    final historicData = await this._repository.getHistorico();
    if (historicData == null) {
      return Left(GetHistoricDataBaseError());
    }
    return historicData;
  }
}
