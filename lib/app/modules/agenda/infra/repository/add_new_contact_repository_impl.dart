import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/repository/add_new_contact_repository.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/datasource/add_new_contact_datasource.dart';

class AddNewContactRepositoryImpl implements AddNewContactRepository {
  final AddNewContactDataSource datasource;

  AddNewContactRepositoryImpl(this.datasource);

  @override
  Future<Either<AgendaFailure, bool>> addNewContactToAgenda(
      ContactEntity contact) async {
    try {
      final result = await datasource.addNewContactToAgenda(contact);
      return Right(result);
    } on DatasourceError catch (error) {
      return Left(DatasourceError(message: error.message));
    }
  }
}
