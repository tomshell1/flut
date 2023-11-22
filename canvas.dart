import 'package:flutter/material.dart';

class CustomPainterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphical Primitives Example'),
      ),
      body: Center(
        child: CustomPaint(
          painter: MyPainter(),
          size: Size(300.0, 400.0),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintStroke = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint paintFill = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    // Draw a filled rectangle
    Rect rect = Rect.fromPoints(Offset(50.0, 50.0), Offset(250.0, 150.0));
    canvas.drawRect(rect, paintFill);

    // Draw a stroked line
    canvas.drawLine(Offset(50.0, 200.0), Offset(250.0, 200.0), paintStroke);

    // Draw a stroked circle
    canvas.drawCircle(Offset(150.0, 350.0), 50.0, paintStroke);

    // Draw a filled and stroked oval
    Rect ovalRect = Rect.fromPoints(Offset(50.0, 400.0), Offset(250.0, 500.0));
    canvas.drawOval(ovalRect, paintFill);
    canvas.drawOval(ovalRect, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomPainterExample(),
  ));
}
