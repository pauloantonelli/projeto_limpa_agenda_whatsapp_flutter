import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/pages/agenda/agenda_controller.dart';
import 'package:whatsapp_agenda/app/pages/agenda/agenda_page.dart';
import 'package:whatsapp_agenda/app/pages/historic/historic_controller.dart';
import 'package:whatsapp_agenda/app/pages/historic/historic_page.dart';
import 'package:whatsapp_agenda/app/pages/home/home_controller.dart';
import 'package:whatsapp_agenda/app/pages/home/home_page.dart';
import 'package:whatsapp_agenda/app/pages/whatsapp/whatsapp_controller.dart';
import 'package:whatsapp_agenda/app/pages/whatsapp/whatsapp_page.dart';

class PagesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => HomeController()),
        Bind((i) => WhatsappController(
              historicoDDD: i.args.params != null ? i.args.params['ddd'] : '',
              historicoTelefone:
                  i.args.params != null ? i.args.params['telefone'] : '',
              historicoMensagem:
                  i.args.params != null ? i.args.params['mensagem'] : '',
              idMensagem: i.args.params != null ? i.args.params['id'] : '',
            )),
        Bind((_) => HistoricController()),
        Bind((_) => AgendaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/whatsapp/:title/:ddd/:telefone/:mensagem/:id',
          child: (_, args) => WhatsappPage(
            title: args.params['title'],
          ),
        ),
        Router('/historic', child: (_, args) => HistoricPage()),
        Router('/agenda', child: (_, args) => AgendaPage()),
      ];

  static Inject get to => Inject<PagesModule>.of();
}
