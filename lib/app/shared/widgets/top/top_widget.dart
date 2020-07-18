import 'package:flutter/material.dart';
import 'package:whatsapp_agenda/app/shared/utils/media_query.dart';

class TopWidget extends StatefulWidget {
  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> with MediaQueryApp {
  @override
  BuildContext get pageContext => super.context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaWidth * 0.05,
        ),
        Text(
          "LIMPA AGÊNDA WHATSAPP",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
