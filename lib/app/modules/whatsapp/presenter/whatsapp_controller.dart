import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp.dart';
import 'package:whatsapp_agenda/app/pages/historic/model/historico.model.dart';
import 'package:whatsapp_agenda/app/shared/utils/sqlite.dart';
import 'package:mobx/mobx.dart';

part 'whatsapp_controller.g.dart';

class WhatsappController = _WhatsappControllerBase with _$WhatsappController;

abstract class _WhatsappControllerBase with Store, Sqlite {
  final OpenChatWhatsapp usecase;
  bool insert = true;
  String historicoDDD = '';
  String historicoTelefone = '';
  String historicoMensagem = '';
  String idMensagem = null;
  @observable
  TextEditingController ddd = new TextEditingController();
  @observable
  TextEditingController telefone = new TextEditingController();
  @observable
  TextEditingController mensagem = new TextEditingController();

  _WhatsappControllerBase({
    this.usecase,
    this.historicoDDD,
    this.historicoTelefone,
    this.historicoMensagem,
    this.idMensagem,
  }) {
    this.ddd = new TextEditingController(text: this.historicoDDD);
    this.telefone = new TextEditingController(text: this.historicoTelefone);
    this.mensagem = new TextEditingController(text: this.historicoMensagem);
    if (this.telefone.value.text.length == 1) {
      this.ddd.clear();
      this.telefone.clear();
      this.mensagem.clear();
    } else if (this.telefone.value.text.length > 1) {
      this.insert = false;
    }
  }

  whatsapp({context: BuildContext, scaffold: Scaffold}) async {
    int ddd = int.parse(this.ddd.value.text.toString());
    int telefone = int.parse(this.telefone.value.text.toString());
    String mensagem = this.mensagem.value.text.toString();
    final result = await this.usecase(ddd, telefone, mensagem);
    result.fold(
      (l) {
        final String result = l.toString();
        if (result.contains('StringEmptyError')) {
          messageEmptyError(context);
        }
      },
      (r) {
        final String result = r.toString();
        if (result.contains('false')) {
          whatsappNotInstalledError(context);
        } else {
          Modular.to.pushReplacementNamed('/');
        }
      },
    );
    // final url = 'whatsapp://send?phone=55$ddd$telefone&text=$mensagem';
    // if (await canLaunch(url)) {
    //   if (this.insert == true) {
    //     this.insertNewHistorico(
    //         ddd: '$ddd', telefone: '$telefone', mensagem: mensagem);
    //     this.snackbar(context: context, message: 'Abrindo Whatsapp');
    //   } else {
    //     int id = int.parse(this.idMensagem);
    //     this.updateHistorico(
    //         id: id, ddd: '$ddd', telefone: '$telefone', mensagem: mensagem);
    //     this.snackbar(context: context, message: 'Abrindo Whatsapp');
    //   }
    //   await launch(url).then((value) => Modular.to.pushReplacementNamed('/'));
    //   this.reset();
    // } else {
    //   if (this.insert == true) {
    //     this.insertNewHistorico(
    //         ddd: '$ddd', telefone: '$telefone', mensagem: mensagem);
    //   } else {
    //     int id = int.parse(this.idMensagem);
    //     this.updateHistorico(
    //         id: id, ddd: '$ddd', telefone: '$telefone', mensagem: mensagem);
    //   }
    //
    // }
  }

  messageEmptyError(
    BuildContext context,
  ) {
    this.snackbar(
        context: context, message: 'Digite algo na mensagem', label: 'Fechar');
    throw 'mensagem vazia';
  }

  whatsappNotInstalledError(
    BuildContext context,
  ) {
    this.snackbar(
        context: context, message: 'Whatsapp não instalado', label: 'Fechar');
    throw 'Whatsapp nao instalado';
  }

  insertNewHistorico({String ddd, String telefone, String mensagem}) async {
    HistoricoModel model =
        new HistoricoModel(ddd: ddd, telefone: telefone, mensagem: mensagem);
    await Sqlite().create(model);
  }

  updateHistorico(
      {int id, String ddd, String telefone, String mensagem}) async {
    HistoricoModel model = new HistoricoModel(
        id: id, ddd: ddd, telefone: telefone, mensagem: mensagem);
    await Sqlite().updateDB(model);
  }

  reset() {
    this.ddd.clear();
    this.telefone.clear();
    this.mensagem.clear();
  }

  snackbar({context: BuildContext, message = '', String label = ''}) {
    final snackbar = new SnackBar(
      backgroundColor: Color(0xff0f4336),
      content: Text(message),
      action: SnackBarAction(
        label: label,
        textColor: Colors.white,
        onPressed: () {},
      ),
      duration: Duration(seconds: 10),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
