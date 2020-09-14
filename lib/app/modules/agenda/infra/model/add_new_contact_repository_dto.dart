import 'package:contacts_service/contacts_service.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';

class AddNewContactRepositoryDto {
  Contact contato;
  toContact(ContactEntity model) {
    contato = Contact(
        givenName: model.givenName,
        suffix: model.suffix,
        phones: Iterable.generate(1, (i) {
          return Item(
              label: model.phones[0].label, value: model.phones[0].value);
        })
        // [
        //   Item(label: model.phones[0].label, value: model.phones[0].value)
        // ]
        );
    return contato;
  }
}
