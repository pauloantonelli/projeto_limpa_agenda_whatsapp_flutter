import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_agenda/app/modules/agenda/datasource/contact_service/contact_service.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact-item.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/model/add_new_contact_repository_dto.dart';

main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  final ContactDataSource datasource = new ContactDataSource();
  final ContactPhoneItemEntity phoneItemEntity =
      new ContactPhoneItemEntity('Celular', '983334275');
  final ContactEntity contactEntity =
      new ContactEntity('Paulo', [phoneItemEntity]);
  final Contact contatoTest =
      AddNewContactRepositoryDto().toContact(contactEntity);
  test('deve adicionar o novo contato a agenda e retornar um status', () {
    final result = datasource.addNewContactToAgenda(contactEntity);
    expect(result, isA<Future<dynamic>>());
  });

  test('dto deve retornar o tipo Contact', () {
    final result = AddNewContactRepositoryDto().toContact(contactEntity);
    expect(result, isA<Contact>());
    expect(result, contatoTest);
  });
}
