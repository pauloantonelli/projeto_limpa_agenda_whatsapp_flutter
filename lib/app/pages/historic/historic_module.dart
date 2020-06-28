import 'package:limpa_agenda_whatsapp/app/pages/historic/historic_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/historic/historic_page.dart';

class HistoricModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HistoricController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HistoricPage()),
      ];

  static Inject get to => Inject<HistoricModule>.of();
}
