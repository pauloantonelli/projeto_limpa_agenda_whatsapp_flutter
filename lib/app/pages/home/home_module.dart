import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/home_page.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/home_controller.dart';

import 'package:limpa_agenda_whatsapp/app/pages/home/widgets/card/card_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CardController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
