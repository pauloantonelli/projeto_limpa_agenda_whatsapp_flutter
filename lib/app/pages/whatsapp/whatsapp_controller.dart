import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'whatsapp_controller.g.dart';

class WhatsappController = _WhatsappControllerBase with _$WhatsappController;

abstract class _WhatsappControllerBase with Store {
  @observable
  TextEditingController ddd = new TextEditingController();
  @observable
  TextEditingController telefone = new TextEditingController();
  @observable
  TextEditingController mensagem = new TextEditingController();

  @action
  void increment() {}

  whatsapp({context: BuildContext, scaffold: Scaffold}) async {
    String ddd = this.ddd.value.text.toString();
    String telefone = this.telefone.value.text.toString();
    String mensagem = this.mensagem.value.text.toString();
    final url = 'whatsapp://send?phone=55$ddd$telefone&text=$mensagem';
    if (await canLaunch(url)) {
      await launch(url);
      this.reset();
    } else {
      this.snackbar(context: context, message: 'Whatsapp não instalado');
      throw 'Could not launch $url';
    }
  }

  reset() {
    this.ddd.clear();
    this.telefone.clear();
    this.mensagem.clear();
  }

  snackbar({context: BuildContext, message = ''}) {
    final snackbar = new SnackBar(
      backgroundColor: Color(0xff0f4336),
      content: Text(message),
      action: SnackBarAction(
        label: 'Fechar',
        textColor: Colors.white,
        onPressed: () {},
      ),
      duration: Duration(seconds: 10),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
