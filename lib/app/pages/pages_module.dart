import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/historic/historic_controller.dart';
import 'package:limpa_agenda_whatsapp/app/pages/historic/historic_page.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/home_controller.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/home_page.dart';
import 'package:limpa_agenda_whatsapp/app/pages/whatsapp/whatsapp_controller.dart';
import 'package:limpa_agenda_whatsapp/app/pages/whatsapp/whatsapp_page.dart';

class PagesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => HomeController()),
        Bind((_) => WhatsappController()),
        Bind((_) => HistoricController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/whatsapp', child: (_, args) => WhatsappPage()),
        Router('/historic', child: (_, args) => HistoricPage()),
      ];

  static Inject get to => Inject<PagesModule>.of();
}
