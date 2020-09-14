import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';

abstract class GetHistoric {
  Future<Either<GetHistoricDataBaseError, List<Map<String, dynamic>>>> call();
}
