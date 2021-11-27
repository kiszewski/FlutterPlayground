import 'package:flutter/material.dart';

class PaintPage extends StatelessWidget {
  const PaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: CirclePaint(),
              child: Text('ola'),
            ),
          ),
        ),
        SizedBox(height: 8),
        FittedBox(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: TrianglePainter(),
            ),
          ),
        ),
      ],
    );
  }
}

class CirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.green;
    paint.strokeWidth = 2.5;

    final offset1 = Offset(size.width / 2, 0);
    final offset2 = Offset(0, size.height);
    final offset3 = Offset(size.width, size.height);

    canvas.drawLine(offset1, offset2, paint);
    canvas.drawLine(offset1, offset3, paint);
    canvas.drawLine(offset2, offset3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
