import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/shared/utils/media_query.dart';
import 'package:limpa_agenda_whatsapp/app/shared/widgets/bottom/bottom_widget.dart';
import 'package:lottie/lottie.dart';
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(
                    'Digite um telefone sem traços ou simbolos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff0f4336),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Caso o numero seja digitado incorretamente o whatsapp vai dizer que o numero nao existe, entao certifique-se de digitar corretamente o numero, sem simbolos',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff0f4336),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      child: TextFormField(
                        controller: controller.ddd,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff0f4336),
                        ),
                        decoration: InputDecoration(
                          labelText: 'DDD',
                          labelStyle: TextStyle(color: Color(0xff0f4336)),
                          icon: Icon(Icons.phone, color: Color(0xff0f4336)),
                        ),
                        autofocus: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.ddd,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff0f4336),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                          labelStyle: TextStyle(color: Color(0xff0f4336)),
                        ),
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.mensagem,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Color(0xff0f4336),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Mensagem inicial *opcional',
                    labelStyle: TextStyle(color: Color(0xff0f4336)),
                    icon: Icon(Icons.message, color: Color(0xff0f4336)),
                  ),
                ),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      this.controller.whatsapp(context: context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Material(
                        color: Color(0xff0f4336),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 65.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Abrir Whatsapp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              Lottie.asset(
                                'assets/chat-btn-whatsapp.json',
                              ),
                            ],
                          ),
                        ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
