import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import 'package:whatsapp_agenda/app/shared/utils/sqlite.dart';

part 'agenda_controller.g.dart';

class AgendaController = _AgendaControllerBase with _$AgendaController;

abstract class _AgendaControllerBase with Store {
  TextEditingController controllerFirstName = new TextEditingController();
  TextEditingController controllerLastName = new TextEditingController();
  BehaviorSubject<bool> openSnackbar = new BehaviorSubject<bool>.seeded(false);

  @observable
  List<Map<String, dynamic>> historico = new List<Map<String, dynamic>>();

  @action
  getDataFromDataBase() {
    Sqlite().getHistorico().then((value) => this.historico = value);
  }

  permitionStatus() async {
    var status = await Permission.contacts.status;
    if (status.isUndetermined) {
      await Permission.contacts.shouldShowRequestRationale;
      await Permission.contacts.request().isGranted;
    }
  }

  isPermitionDenied() async {
    var status = await Permission.contacts.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  addNewContactToAgenda(Contact contato, BuildContext context) async {
    try {
      await ContactsService.addContact(contato).then((value) {
        this.controllerFirstName.clear();
        this.controllerLastName.clear();
        final time = Future.delayed(Duration(milliseconds: 800));
        time.asStream().listen((event) {
          this.openSnackbar.sink.add(true);
        });
      });
    } catch (e) {
      print('erro: $e');
    }
  }

  Future<void> openDialog(
      BuildContext context, String ddd, String telefone) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Para criar um novo contato',
                    style: TextStyle(color: Color(0xff0f4336)),
                  ),
                  Text(
                    'primeiro insira um nome e sobre nome',
                    style: TextStyle(color: Color(0xff0f4336)),
                  ),
                  TextField(
                    controller: this.controllerFirstName,
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Nome: '),
                  ),
                  TextField(
                    controller: this.controllerLastName,
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Sobrenome: '),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.red,
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      FlatButton(
                        color: Color(0xff0f4336),
                        child: Text(
                          'Gravar na agenda',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (this.controllerFirstName.value.text.isNotEmpty &&
                              this.controllerLastName.value.text.isNotEmpty) {
                            final contato = Contact(
                                givenName:
                                    '${this.controllerFirstName.value.text} ${this.controllerLastName.value.text}',
                                // suffix: this
                                //     .controllerLastName
                                //     .value
                                //     .text
                                //     .toString(),
                                phones: [
                                  Item(label: 'whatsapp', value: ddd + telefone)
                                ]);
                            this.addNewContactToAgenda(contato, context);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
