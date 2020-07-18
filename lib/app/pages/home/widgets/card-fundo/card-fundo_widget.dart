import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/pages/home/home_controller.dart';
import 'card-fundo_controller.dart';

class CardFundoWidget extends StatefulWidget {
  @override
  _CardFundoWidgetState createState() => _CardFundoWidgetState();
}

class _CardFundoWidgetState
    extends ModularState<CardFundoWidget, CardFundoController> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          decoration: BoxDecoration(color: Color(0xffcf8a60)),
          width: MediaQuery.of(context).size.width * 0.92,
          height: MediaQuery.of(context).size.height * 0.54,
          padding: EdgeInsets.fromLTRB(35.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 35.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  heightFactor: 2.0,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Observer(
                      builder: (_) => Text(
                        this.homeController.title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: Observer(
                  builder: (_) => Text(
                    this.homeController.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 17.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250.0),
                child: Observer(
                  builder: (_) => Text(
                    this.homeController.subtitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 37.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
