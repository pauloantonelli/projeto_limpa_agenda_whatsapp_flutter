import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:limpa_agenda_whatsapp/app/pages/home/home_controller.dart';
import 'package:lottie/lottie.dart';

Widget buttonLink({int index = 0, String animatedIcon = 'whatsapp-icon'}) {
  final buttonSize = 70.0;
  final pageController = Modular.get<HomeController>();
  return GestureDetector(
    onTap: () {
      pageController.controllerPage.jumpToPage(index ?? index.toInt());
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(color: Colors.white),
        child: Lottie.asset(
          'assets/$animatedIcon.json',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
