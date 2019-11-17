import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RayDiagramPainter extends CustomPainter {
  double u = -300.0;
  double v = 0.0;
  double f = 100.0;
  final h = 50.0;
  final Paint _axisPaint = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final Paint _pointsPaint = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.fill;

  final Paint _objectPaint = Paint()
    ..color = Colors.black87
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0;

  final Paint _imagePaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0;

  final Paint _rayPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  double i;

  RayDiagramPainter(
    this.u,
    this.v,
    this.f,
  ) {
    i = (v / u) * h;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;
    final width = size.width;

    drawAxes(canvas, size);

    final ux = x0 + u;
    final objectPath = Path();
    objectPath.moveTo(ux, y0);
    objectPath.lineTo(ux, y0 - h);
    objectPath.addOval(Rect.fromCircle(center: Offset(ux, y0 - h), radius: 4));
    canvas.drawPath(objectPath, _objectPaint);

    var span = TextSpan(
      text: "O",
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
    );
    var tpo = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tpo.layout();
    tpo.paint(canvas, new Offset(ux + 2, y0));

    final objectRayPath = Path();
    objectRayPath.moveTo(ux, y0 - h);
    objectRayPath.lineTo(x0, y0);
    objectRayPath.moveTo(ux, y0 - h);
    objectRayPath.lineTo(x0, y0 - h);
    canvas.drawPath(objectRayPath, _rayPaint);

    final vx = x0 + v;
    final imagePath = Path();
    imagePath.moveTo(vx, y0);
    imagePath.lineTo(vx, y0 - i);
    imagePath.addOval(Rect.fromCircle(center: Offset(vx, y0 - i), radius: 4));
    canvas.drawPath(imagePath, _imagePaint);

    var span1 = TextSpan(
      text: "I",
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    );
    var tpi = TextPainter(
      text: span1,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tpi.layout();
    tpi.paint(canvas, new Offset(vx + 8, y0));

    final imageRayPath = Path();
    imageRayPath.moveTo(vx, y0 - i);
    imageRayPath.lineTo(x0, y0);
    imageRayPath.moveTo(vx, y0 - i);
    imageRayPath.lineTo(x0, y0 - h);
    canvas.drawPath(imageRayPath, _rayPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawAxes(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;
    final width = size.width;

    final xAxisPath = Path();
    xAxisPath.reset();
    xAxisPath.moveTo(0, y0);
    xAxisPath.lineTo(width, y0);
/*    canvas.drawArc(
      Rect.fromCircle(center: Offset(x0 + (2 * f), y0), radius: (2 * f) + 32),
      pi / 1.22,
      pi / 2.78,
      false,
      _axisPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(x0 - (2 * f), y0), radius: (2 * f) + 32),
      pi + (pi / 1.22),
      (pi / 2.78),
      false,
      _axisPaint,
    );*/
    canvas.drawPath(xAxisPath, _axisPaint);

    xAxisPath.addOval(Rect.fromCircle(center: Offset(x0 - (f), y0), radius: 2));
    xAxisPath
        .addOval(Rect.fromCircle(center: Offset(x0 - (2 * f), y0), radius: 2));
    xAxisPath.addOval(Rect.fromCircle(center: Offset(x0 + (f), y0), radius: 2));
    xAxisPath
        .addOval(Rect.fromCircle(center: Offset(x0 + (2 * f), y0), radius: 2));

    canvas.drawPath(xAxisPath, _pointsPaint);

    final yAxisPath = Path();
    yAxisPath.reset();
    yAxisPath.moveTo(x0, y0 * 2);
    yAxisPath.lineTo(x0, 0);
    canvas.drawPath(yAxisPath, _axisPaint);

    var span = TextSpan(text: "O", style: TextStyle(color: Colors.black54));
    var span1 = TextSpan(text: "F", style: TextStyle(color: Colors.black54));
    var span2 = TextSpan(text: "2F", style: TextStyle(color: Colors.black54));
    var tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    var tpf = TextPainter(
      text: span1,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    var tp2f = TextPainter(
      text: span2,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    var tpf_1 = TextPainter(
      text: span1,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    var tpf_2 = TextPainter(
      text: span2,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tpf.layout();
    tp2f.layout();
    tpf_1.layout();
    tpf_2.layout();
    tp.paint(canvas, new Offset(x0 + 2, y0));
    tpf.paint(canvas, new Offset(x0 + 2 - f, y0));
    tp2f.paint(canvas, new Offset(x0 + 2 - f - f, y0));
    tpf_1.paint(canvas, new Offset(x0 + 2 + f, y0));
    tpf_2.paint(canvas, new Offset(x0 + 2 + f + f, y0));
  }
}
