import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact-item.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/datasource/add_new_contact_datasource.dart';
import 'package:whatsapp_agenda/app/modules/agenda/infra/repository/add_new_contact_repository_impl.dart';

class AddNewContactDataSourceMock extends Mock
    implements AddNewContactDataSource {}

main() {
  final AddNewContactDataSource datasource = new AddNewContactDataSourceMock();
  final AddNewContactRepositoryImpl usecase =
      new AddNewContactRepositoryImpl(datasource);
  test('deve retornar um valor do datasource', () async {
    final phones = new ContactPhoneItemEntity('celular', '983334275');
    final contact = new ContactEntity('Paulo', [phones]);
    when(datasource.addNewContactToAgenda(any)).thenAnswer((_) async => true);
    final result = await usecase.addNewContactToAgenda(contact);
    expect(result | null, isA<bool>());
  });
}
