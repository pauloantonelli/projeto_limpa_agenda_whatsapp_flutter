import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';

abstract class InsertNewHistoricRepository {
  Future<Either<InsertHistoricDataBaseError, Future<int>>> insertNewHistorico(
      HistoricEntity model);
}
