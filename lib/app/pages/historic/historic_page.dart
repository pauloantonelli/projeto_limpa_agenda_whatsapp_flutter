import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
