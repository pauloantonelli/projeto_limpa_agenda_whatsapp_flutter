import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/datasource/open_chat_whatsapp_datasource.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/repository/open_chat_whatsapp_repository_impl.dart';

class OpenChatDataSourceMock extends Mock implements OpenChatDataSource {}

main() {
  final OpenChatDataSource dataSource = OpenChatDataSourceMock();
  final OpenChatWhatsappRepositoryImpl repository =
      OpenChatWhatsappRepositoryImpl(dataSource);

  test('deve retornar um true caso tenha enviado a mensagem', () async {
    when(dataSource.openChat(any, any, any))
        .thenAnswer((_) => Future.value(true));

    final result =
        await repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
            011, 983334275, 'ola mundo');
    expect(result.fold((l) => l, (r) => r), true);
  });
}
