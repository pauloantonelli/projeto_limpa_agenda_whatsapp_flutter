import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact-item.dart';

class ContactEntity {
  final String givenName;
  final String suffix;
  final List<ContactPhoneItemEntity> phones;
  ContactEntity(this.givenName, this.phones, {this.suffix});
}
