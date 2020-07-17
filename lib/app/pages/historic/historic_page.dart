import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/historic/model/historico.model.dart';
import 'historic_controller.dart';

class HistoricPage extends StatefulWidget {
  final String title;
  const HistoricPage({Key key, this.title = "Historic"}) : super(key: key);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState
    extends ModularState<HistoricPage, HistoricController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff0f4336),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              HistoricoModel request = HistoricoModel(
                  id: 1, telefone: '11983334275', mensagem: 'Olá sqflite!');
              this.controller.create(request);
            },
            child: Text('create'),
          ),
          FlatButton(
            onPressed: () {
              final response = this.controller.getHistorico();
              response.then((value) => print(value));
            },
            child: Text('Get'),
          ),
          FlatButton(
            onPressed: () {
              HistoricoModel request = HistoricoModel(
                  id: 1,
                  telefone: '11983334275',
                  mensagem: 'Olá sqflite seu lindo :D!');
              this.controller.updateDB(request);
            },
            child: Text('update'),
          ),
          FlatButton(
            onPressed: () {
              HistoricoModel request = HistoricoModel(id: 1);

              this.controller.delete(request);
            },
            child: Text('delete'),
          ),
          Observer(
            builder: (context) {
              return Text('sqflite: ${controller.sqflite}');
            },
          )
        ],
      ),
    );
  }
}
