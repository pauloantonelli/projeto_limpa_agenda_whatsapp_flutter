import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/Custom/whatsapp-clipper.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/widgets/card/card_widget.dart';
import 'package:limpa_agenda_whatsapp/app/shared/widgets/bottom/bottom_widget.dart';
import 'package:limpa_agenda_whatsapp/app/shared/widgets/top/top_widget.dart';
import 'home_controller.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    PageController pagecontroller = controller.controllerPage;
    return Scaffold(
      backgroundColor: Color(0xff0f4336),
      body: Container(
        child: Column(
          children: <Widget>[
            TopWidget(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 50.0,
              child: PageView(
                controller: pagecontroller,
                children: <Widget>[
                  this._cardComposition(
                      title: 'WHATSAPP',
                      subtitle:
                          'Entre com um numero de telefone e se esse telefone estiver cadastrado no whatsapp, converse com esse numero sem precisar salvar nada na agenda!',
                      icon: 'whatsapp'),
                  this._cardComposition(
                      title: 'HISTÓRICO',
                      subtitle:
                          'Acesse seu histórico de números utilizados, e chame de novo no whatsapp sem precisar salvar nada na sua agenda',
                      icon: 'history-icon'),
                  this._cardComposition(
                      title: 'ADICIONAR A AGÊNDA',
                      subtitle:
                          'Adicione na sua agênda os numeros que você já chamou no whatsapp',
                      icon: 'add-contact-icon'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomWidget(),
    );
  }

  Widget _cardComposition(
      {String title = '', String subtitle = '', String icon = 'whatsapp'}) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: 70.0,
                right: 0.0,
                child: CardWidget(title: title, subtitle: subtitle),
              ),
              Align(
                alignment: Alignment.topLeft,
                heightFactor: 1.4,
                child: ClipPath(
                  clipper: WhatsappClipper(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.82,
                        height: MediaQuery.of(context).size.height * 0.50,
                        // padding: EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          'assets/$icon.json',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
