import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/datasource/url_launcher/open_chat_whatsapp_datasource_impl.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';

class OpenChatWhatsappDatasourceImplMock extends Mock
    implements UrlLauncherPlatform {}

main() {
  final OpenChatWhatsappDatasourceImplMock urlLauncher =
      OpenChatWhatsappDatasourceImplMock();
  final OpenChatWhatsappDatasourceImpl datasource =
      OpenChatWhatsappDatasourceImpl();
  test('deve retornar true quando puder disparar mensagem', () async {
    when(urlLauncher.canLaunch(any))
        .thenThrow((_) => Future.value(DatasourceError()));

    final result = await datasource.openChat(011, 983334275, 'Olá Mundo');
    expect(result | null, true);
  });
}
