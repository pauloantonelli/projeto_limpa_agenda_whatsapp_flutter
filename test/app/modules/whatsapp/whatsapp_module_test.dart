import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp_impl.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/datasource/open_chat_whatsapp_datasource.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/whatsapp_module.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initModule(WhatsappModule());
  test('deve recuperar o usecase sem problemas', () {
    final usecase = Modular.get<OpenChatWhatsapp>();
    expect(usecase, isA<OpenChatWhatsappImpl>());
  });
  test('deve realizar um disparo de mensagem sem erros', () async {
    final datasource = Modular.get<OpenChatWhatsappDatasource>();
    final result = await datasource.openChat(011, 983334275, 'ola mundo 8)');
    expect(result | null, isA<bool>());
  });
}
