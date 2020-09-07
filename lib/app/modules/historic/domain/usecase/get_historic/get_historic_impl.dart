import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/usecase/get_historic/get_historic.dart';

class GetHistoricImpl implements GetHistoric {
  @override
  Future<Either<GetHistoricDataBaseError, List<Map<String, dynamic>>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
