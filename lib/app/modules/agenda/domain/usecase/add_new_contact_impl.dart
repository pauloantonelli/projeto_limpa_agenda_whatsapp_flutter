import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/repository/add_new_contact_repository.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/usecase/add_new_contact.dart';

class AddNewContactImpl implements AddNewContact {
  final AddNewContactRepository _repository;

  AddNewContactImpl(this._repository);
  @override
  Future<Either<AgendaFailure, bool>> call(ContactEntity contact) async {
    final result = await _repository.addNewContactToAgenda(contact);
    if (contact == null) {
      return Left(AgendaNullError());
    }
    if (contact.phones.isEmpty) {
      return Left(PhonesEmptyError());
    }
    if (contact.givenName.length <= 0) {
      return Left(NameEmptyError());
    }
    return result;
  }
}
