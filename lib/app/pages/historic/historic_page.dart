import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/pages/historic/model/historico.model.dart';
import 'historic_controller.dart';

class HistoricPage extends StatefulWidget {
  final String title;
  const HistoricPage({Key key, this.title = "Histórico recente"})
      : super(key: key);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState
    extends ModularState<HistoricPage, HistoricController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.controller.getDataFromDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff0f4336),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Histórico Recente',
            style: TextStyle(
                color: Color(0xffe53934),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Lista de todos os contatos feitos recentemente:',
            style: TextStyle(
                color: Color(0xffe53934),
                fontSize: 15.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 280.0,
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: this.controller.historico.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                            title: numeros(
                          ddd: this.controller.historico[i]['ddd'].toString(),
                          telefone: this
                              .controller
                              .historico[i]['telefone']
                              .toString(),
                          mensagem: this
                              .controller
                              .historico[i]['mensagem']
                              .toString(),
                          id: this.controller.historico[i]['id'],
                        ));
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget numeros({String ddd, String telefone, String mensagem, int id}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.4,
                  color: Color(0xff0f4336),
                  style: BorderStyle.solid))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '($ddd)',
                    style: TextStyle(
                        color: Color(0xff0f4336),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    telefone,
                    style: TextStyle(
                        color: Color(0xff0f4336),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 30.0,
                    margin: EdgeInsets.only(right: 15.0),
                    child: FlatButton(
                      color: Colors.red,
                      child: Icon(
                        Icons.delete_forever,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        this.controller.delete(id).then(
                            (value) => this.controller.getDataFromDataBase());
                      },
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 30.0,
                    child: FlatButton(
                      color: Color(0xff0f4336),
                      child: Icon(
                        Icons.history,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Modular.to.pushReplacementNamed(
                          '/whatsapp/Chame no Whatsapp/$ddd/$telefone/$mensagem/$id',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            mensagem,
            style: TextStyle(fontSize: 15.0, color: Color(0xff0f4336)),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
