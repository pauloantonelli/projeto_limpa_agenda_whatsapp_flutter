import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/modules/home/home_controller.dart';
import 'package:whatsapp_agenda/app/modules/home/home_page.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/datasource/url_launcher/open_chat_whatsapp_datasource_impl.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp_impl.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/repository/open_chat_whatsapp_repository_impl.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/presenter/whatsapp_controller.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/presenter/whatsapp_page.dart';

import 'domain/repository/open_chat_whatsapp_repository.dart';
import 'domain/usecase/open_chat_whatsapp.dart';
import 'infra/datasource/open_chat_whatsapp_datasource.dart';

class WhatsappModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OpenChatWhatsappImpl(i.get<OpenChatWhatsappRepository>())),
        Bind((i) => OpenChatWhatsappRepositoryImpl(
            i.get<OpenChatWhatsappDatasource>())),
        Bind((i) => OpenChatWhatsappDatasourceImpl()),
        Bind((i) => HomeController()),
        Bind(
          (i) => WhatsappController(
            usecase: i.get<OpenChatWhatsapp>(),
            historicoDDD: i.args.params != null ? i.args.params['ddd'] : '',
            historicoTelefone:
                i.args.params != null ? i.args.params['telefone'] : '',
            historicoMensagem:
                i.args.params != null ? i.args.params['mensagem'] : '',
            idMensagem: i.args.params != null ? i.args.params['id'] : '',
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (context, args) => HomePage(),
        ),
        Router(
          '/whatsapp/:title/:ddd/:telefone/:mensagem/:id',
          child: (_, args) => WhatsappPage(
            title: args.params['title'],
          ),
        ),
      ];

  static Inject get to => Inject<WhatsappModule>.of();
}
