


import 'package:flutter/cupertino.dart';

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff2b374f);
    Path path = Path()
      ..relativeLineTo(0, 25)
      ..quadraticBezierTo(size.width / 2, 120.0, size.width, 25)
      ..relativeLineTo(0, -25)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
