import 'package:limpa_agenda_whatsapp/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:limpa_agenda_whatsapp/app/app_widget.dart';
import 'package:limpa_agenda_whatsapp/app/pages/pages_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: PagesModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
