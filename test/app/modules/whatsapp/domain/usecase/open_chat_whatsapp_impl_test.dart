import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/repository/open_chat_whatsapp_repository.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp_impl.dart';

class OpenChatWhatsappRepositoryMock extends Mock
    implements OpenChatWhatsappRepository {}

main() {
  final OpenChatWhatsappRepositoryMock _repository =
      new OpenChatWhatsappRepositoryMock();
  final OpenChatWhatsappImpl usecase = new OpenChatWhatsappImpl(_repository);

  test('deve retornar o ddd, telefone, e a mensagem que receber', () async {
    when(_repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
            any, any, any))
        .thenAnswer((_) => Future.value(Right(true)));

    final result = await usecase(012, 983334274, 'Ola');
    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<bool>());
  });

  test(
      'deve retornar um erro quando o ddd ou o telefone ou a mensagem for nula',
      () async {
    when(_repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
            any, any, any))
        .thenAnswer((_) => Future.value(Right(true)));

    final result = await usecase(null, null, 'Ola');
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<NullError>());
  });

  test(
      'deve retornar um erro quando o ddd e o telefone forem algum numero negativo',
      () async {
    when(_repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
            any, any, any))
        .thenAnswer((_) => Future.value(Right(true)));

    final result = await usecase(-012, -983334274, 'Ola');
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<NegativeNumberError>());
  });

  test('deve retornar um erro quando o conteudo da mensagem for vazio',
      () async {
    when(_repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
            any, any, any))
        .thenAnswer((_) => Future.value(Right(true)));

    final result = await usecase(011, 983334275, '');
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<StringEmptyError>());
  });
}
