import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  final Paint _axisPaint = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;
  final Paint _graphPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;
  final Paint _graphPaint2 = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  final scaleFactor;

  GraphPainter(this.scaleFactor);

  @override
  void paint(Canvas canvas, Size size) {
    drawAxes(canvas, size);
    drawGraph(canvas, size);
  }

  void drawAxes(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;
    final width = size.width;

    final xAxisPath = Path();
    xAxisPath.reset();
    xAxisPath.moveTo(0, y0);
    xAxisPath.lineTo(width, y0);
    canvas.drawPath(xAxisPath, _axisPaint);

    final yAxisPath = Path();
    yAxisPath.reset();
    yAxisPath.moveTo(x0, y0 * 2);
    yAxisPath.lineTo(x0, 0);
    canvas.drawPath(yAxisPath, _axisPaint);

    drawXNumbers(canvas, size);
    drawYNumbers(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawXNumbers(Canvas canvas, Size size) {
    final x0 = _getOriginX(size);
    final y0 = _getOriginY(size);
    //final interval = 10.0 - ((((scaleFactor / 10) as double).floor() - 1) * 5);
    final interval = 5.0;
    for (double x = 0; x < (size.width / 2); x += interval) {
      final xAxisOffset = (x * scaleFactor);
      final tpi = TextPainter(
        text: TextSpan(
          text: "${x.toStringAsFixed(1)}",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tpi
        ..layout()
        ..paint(canvas, new Offset(x0 + xAxisOffset, y0));

      if (x != 0) {
        final tpi2 = TextPainter(
          text: TextSpan(
            text: "-${x.toStringAsFixed(0)}",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tpi2
          ..layout()
          ..paint(canvas, new Offset(x0 - xAxisOffset, y0));
      }

      final xAxisPoint = Path();
      xAxisPoint.moveTo(x0 + xAxisOffset, y0 + 4);
      xAxisPoint.lineTo(x0 + xAxisOffset, y0 - 4);
      xAxisPoint.moveTo(x0 - xAxisOffset, y0 + 4);
      xAxisPoint.lineTo(x0 - xAxisOffset, y0 - 4);
      canvas.drawPath(xAxisPoint, _axisPaint);
    }
  }

  void drawYNumbers(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;
    for (int i = 5; i < (size.width / 2 / scaleFactor); i += 5) {
      final xAxisOffset = (i * scaleFactor);
      final tpi = TextPainter(
        text: TextSpan(
          text: "-${i.toStringAsFixed(0)}",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tpi
        ..layout()
        ..paint(canvas, new Offset(x0, y0 + xAxisOffset));

      final tpi2 = TextPainter(
        text: TextSpan(
          text: "${i.toStringAsFixed(0)}",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tpi2
        ..layout()
        ..paint(canvas, new Offset(x0, y0 - xAxisOffset));

      final xAxisPoint = Path();
      xAxisPoint.moveTo(x0 + 4, y0 + xAxisOffset);
      xAxisPoint.lineTo(x0 - 4, y0 + xAxisOffset);
      xAxisPoint.moveTo(x0 + 4, y0 - xAxisOffset);
      xAxisPoint.lineTo(x0 - 4, y0 - xAxisOffset);
      canvas.drawPath(xAxisPoint, _axisPaint);
    }
  }

  void drawGraph(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    final graphPath = Path();
    final graphPath2 = Path();
    graphPath.moveTo(x0, y0);
    graphPath2.moveTo(x0, y0);
    final graphPath3 = Path();
    final graphPath4 = Path();
    graphPath3.moveTo(x0, y0);
    graphPath4.moveTo(x0, y0);
    for (double x = 0; x < x0; x += 0.1) {
      final y = pow(x, 2);
      graphPath.lineTo(getX(x, x0), getY(y, y0));
      final y2 = pow(-x, 2);
      graphPath2.lineTo(getX(-x, x0), getY(y2, y0));
      final y3 = sin(x);
      graphPath3.lineTo(getX(x, x0), getY(y3, y0));
      final y4 = sin(-x);
      graphPath4.lineTo(getX(-x, x0), getY(y4, y0));
    }
    canvas.drawPath(graphPath, _graphPaint);
    canvas.drawPath(graphPath2, _graphPaint);
    canvas.drawPath(graphPath3, _graphPaint2);
    canvas.drawPath(graphPath4, _graphPaint2);
  }

  double getY(double y, double y0) {
    return y0 - (y * scaleFactor);
  }

  double getX(double x, double x0) {
    return x0 + (x * scaleFactor);
  }

  double _getOriginX(Size size) {
    return size.width / 2;
  }

  double _getOriginY(Size size) {
    return size.height / 2;
  }
}
