import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';

abstract class AddNewContactDataSource {
  Future<dynamic> addNewContactToAgenda(ContactEntity contact);
}
