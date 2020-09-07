import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_agenda/app/pages/home/home_controller.dart';

class CardWidget extends StatelessWidget {
  final homeController = Modular.get<HomeController>();
  String title;
  String subtitle;
  CardWidget({this.title = '', this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          decoration: BoxDecoration(color: Color(0xffcf8a60)),
          width: MediaQuery.of(context).size.width * 0.92,
          height: MediaQuery.of(context).size.height * 0.55,
          padding: EdgeInsets.fromLTRB(35.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  heightFactor: 1.2,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Observer(
                      builder: (_) => Text(
                        this.homeController.title ?? this.title,
                        textAlign: TextAlign.left,
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
                    this.homeController.title ?? this.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250.0),
                child: Observer(
                  builder: (_) => Text(
                    this.homeController.subtitle ?? this.subtitle,
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
                height: 27.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
