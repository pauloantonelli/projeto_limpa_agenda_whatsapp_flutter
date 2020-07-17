import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0f4336),
      ),
      navigatorKey: Modular.navigatorKey,
      title: 'Limpa Agenda Whatsapp',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
