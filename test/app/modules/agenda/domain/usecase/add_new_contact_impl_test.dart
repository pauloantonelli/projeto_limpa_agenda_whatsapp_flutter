import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact-item.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/repository/add_new_contact_repository.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/usecase/add_new_contact_impl.dart';

class AddNewContactRepositoryMock extends Mock
    implements AddNewContactRepository {}

main() {
  final AddNewContactRepository repository = new AddNewContactRepositoryMock();
  final AddNewContactImpl usecase = new AddNewContactImpl(repository);
  test('deve adicionar um novo contato na agenda e retornar um status',
      () async {
    final phones = new ContactPhoneItemEntity('celular', '983334275');
    final contact = new ContactEntity('Paulo', [phones]);
    when(repository.addNewContactToAgenda(any))
        .thenAnswer((_) async => Right(true));
    final result = await usecase(contact);
    expect(result | null, isA<bool>());
  });

  test(
      'deve retornar um erro caso volte um nulo ao adicionar um novo contato na agenda',
      () async {
    final phones = new ContactPhoneItemEntity('celular', '983334275');
    final contact = new ContactEntity('Paulo', [phones]);
    when(repository.addNewContactToAgenda(any))
        .thenAnswer((_) async => Right(null));
    final result = await usecase(contact);
    expect(result | null, null);
  });

  test('deve retornar um erro caso não haja dados de contato para a agenda',
      () async {
    final phones = new ContactPhoneItemEntity('celular', '983334275');
    final contact = null;
    when(repository.addNewContactToAgenda(any))
        .thenAnswer((_) async => Right(true));
    final result = await usecase(contact);
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<AgendaNullError>());
  });
}
