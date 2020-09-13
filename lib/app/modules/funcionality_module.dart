import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/modules/home/home_controller.dart';
import 'package:whatsapp_agenda/app/modules/home/home_page.dart';

import 'historic/datasource/sqlite/sqlite.dart';
import 'historic/domain/usecase/delete_historic/delete_historic_impl.dart';
import 'historic/domain/usecase/get_historic/get_historic_impl.dart';
import 'historic/domain/usecase/insert_new_historic/insert_new_historic_impl.dart';
import 'historic/domain/usecase/update_historic/update_historic_impl.dart';
import 'historic/infra/repository/delete_historic_repository_impl.dart';
import 'historic/infra/repository/get_historic_repository_impl.dart';
import 'historic/infra/repository/insert_new_historic_repository_impl.dart';
import 'historic/infra/repository/update_historic_repository_impl.dart';
import 'historic/presenter/historic_page.dart';
import 'historic/presenter/historic_controller.dart';
import 'whatsapp/datasource/url_launcher/open_chat_whatsapp_datasource_impl.dart';
import 'whatsapp/domain/repository/open_chat_whatsapp_repository.dart';
import 'whatsapp/domain/usecase/open_chat_whatsapp.dart';
import 'whatsapp/domain/usecase/open_chat_whatsapp_impl.dart';
import 'whatsapp/infra/datasource/open_chat_whatsapp_datasource.dart';
import 'whatsapp/infra/repository/open_chat_whatsapp_repository_impl.dart';
import 'whatsapp/presenter/whatsapp_controller.dart';
import 'whatsapp/presenter/whatsapp_page.dart';

class FuncionalityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) =>
            OpenChatWhatsappImpl(i.get<OpenChatWhatsappRepository>(), i.get())),
        Bind((i) => OpenChatWhatsappRepositoryImpl(
            i.get<OpenChatWhatsappDatasource>())),
        Bind((i) => OpenChatWhatsappDatasourceImpl()),
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
        Bind((i) => GetHistoricImpl(i.get())),
        Bind((i) => InsertNewHistoricImpl(i.get())),
        Bind((i) => UpdateHistoricImpl(i.get())),
        Bind((i) => DeleteHistoricImpl(i.get())),
        Bind((i) => GetHistoricRepositoryImpl(i.get())),
        Bind((i) => InsertNewHistoricRepositoryImpl(i.get())),
        Bind((i) => UpdateHistoricRepositoryImpl(i.get())),
        Bind((i) => DeleteHistoricRepositoryImpl(i.get())),
        Bind((i) => HistoricSqliteDataSource()),
        Bind((i) => HistoricController(i.get(), i.get()))
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
        Router('/historic', child: (_, args) => HistoricPage()),
        // Router('/agenda', child: (_, args) => AgendaPage()),
      ];

  static Inject get to => Inject<FuncionalityModule>.of();
}
