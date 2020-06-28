import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
