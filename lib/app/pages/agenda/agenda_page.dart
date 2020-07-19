import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:build_context/build_context.dart';

import 'agenda_controller.dart';

class AgendaPage extends StatefulWidget {
  final String title;
  const AgendaPage({Key key, this.title = "Agenda"}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends ModularState<AgendaPage, AgendaController> {
  @override
  void initState() {
    super.initState();
    this.controller.permitionStatus();
    this.controller.getDataFromDataBase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.controller.openSnackbar.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    snackbar({context: BuildContext, message = '', String label = ''}) {
      final snackbar = new SnackBar(
        backgroundColor: Color(0xff0f4336),
        content: Text(message),
        action: SnackBarAction(
          label: label,
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: Duration(seconds: 5),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff0f4336),
      ),
      body: Builder(
        builder: (context) {
          this.controller.openSnackbar.stream.listen((event) {
            if (event == true) {
              snackbar(context: context, message: 'Concluido', label: 'Fechar');
            }
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                              ddd: this
                                  .controller
                                  .historico[i]['ddd']
                                  .toString(),
                              telefone: this
                                  .controller
                                  .historico[i]['telefone']
                                  .toString(),
                            ));
                          },
                        );
                      },
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget numeros({String ddd, String telefone}) {
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
                      color: Color(0xff0f4336),
                      child: Icon(
                        Icons.content_copy,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ClipboardManager.copyToClipBoard('$ddd$telefone')
                            .then((result) {
                          print(
                              'copiar numero do contato na memoria e avisar usuario');
                          print(result);
                          this.controller.openSnackbar.sink.add(true);
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 30.0,
                    child: FlatButton(
                      color: Color(0xff0f4336),
                      child: Icon(
                        Icons.contact_phone,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        this.controller.openDialog(context, ddd, telefone);
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
        ],
      ),
    );
  }
}
