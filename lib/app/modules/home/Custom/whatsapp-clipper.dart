import 'package:flutter/material.dart';

class WhatsappClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path.quadraticBezierTo(x1, y1, x2, y2)
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        0.0, size.height - 50, size.width / 5, size.height - 50);
    path.quadraticBezierTo(
        (3 / 4 * size.width), size.height - 30, size.width, size.height - 50);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldCliper) {
    return oldCliper != this;
  }
}
