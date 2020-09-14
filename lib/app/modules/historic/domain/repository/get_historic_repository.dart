import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';

abstract class GetHistoricRepository {
  Future<Either<GetHistoricDataBaseError, List<Map<String, dynamic>>>>
      getHistorico();
}
