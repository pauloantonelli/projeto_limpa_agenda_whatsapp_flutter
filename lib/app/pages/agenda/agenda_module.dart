import 'package:limpa_agenda_whatsapp/app/pages/agenda/agenda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/agenda/agenda_page.dart';

class AgendaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AgendaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AgendaPage()),
      ];

  static Inject get to => Inject<AgendaModule>.of();
}
