import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';

abstract class InsertNewHistoric {
  Future<Either<InsertHistoricDataBaseError, bool>> call(HistoricEntity model);
}
