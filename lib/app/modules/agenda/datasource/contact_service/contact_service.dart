import 'package:contacts_service/contacts_service.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/datasource/add_new_contact_datasource.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/model/add_new_contact_repository_dto.dart';

class ContactDataSource implements AddNewContactDataSource {
  @override
  Future<dynamic> addNewContactToAgenda(ContactEntity contact) async {
    try {
      final Contact contato = AddNewContactRepositoryDto().toContact(contact);
      ContactsService.addContact(contato);
      return Future.value(true);
    } catch (e) {
      print('erro: $e');
      return DatasourceError();
    }
  }
}
