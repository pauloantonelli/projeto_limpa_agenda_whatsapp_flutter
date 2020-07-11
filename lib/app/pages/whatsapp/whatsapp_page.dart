import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/shared/utils/media_query.dart';
import 'whatsapp_controller.dart';

class WhatsappPage extends StatefulWidget {
  final String title;
  const WhatsappPage({Key key, this.title = "Whatsapp"}) : super(key: key);

  @override
  _WhatsappPageState createState() => _WhatsappPageState();
}

class _WhatsappPageState
    extends ModularState<WhatsappPage, WhatsappController> {
  //use 'controller' variable to access controller
// final teste = controller.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff0f4336),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Text('Digite um telefone sem traços ou simbolos'),
            ),
            Container(
              child: Text(
                  'Caso o numero seja digitado incorretamente o whatsapp vai dizer que o numero nao existe, entao certifique-se de digitar corretamente o numero, sem simbolos'),
            ),
            TextFormField(
              controller: controller.formText,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'DDD'),
            ),
            TextFormField(
              controller: controller.formText,
              keyboardType: TextInputType.phone,
              decoration:
                  InputDecoration(labelText: '*mensagem inicial opcional'),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                // width: MediaQueryApp().mediaWidth,
                decoration: BoxDecoration(color: Color(0xff0f4336)),
                child: Text(
                  'Enviar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
