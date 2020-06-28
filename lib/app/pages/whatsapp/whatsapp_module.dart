import 'package:limpa_agenda_whatsapp/app/pages/whatsapp/whatsapp_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/whatsapp/whatsapp_page.dart';

class WhatsappModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WhatsappController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => WhatsappPage()),
      ];

  static Inject get to => Inject<WhatsappModule>.of();
}
