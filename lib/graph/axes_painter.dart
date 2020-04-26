import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AxesPainter extends CustomPainter {
  final Paint _axisPaint = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;
  final scaleFactor;

  AxesPainter(this.scaleFactor);

  @override
  void paint(Canvas canvas, Size size) {
    drawAxes(canvas, size);
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
    final interval = 5.0;
    for (double x = 0; x < (size.width / 2); x += interval) {
      final xAxisOffset = (x * scaleFactor);
      final tpi = TextPainter(
        text: TextSpan(
          text: "${x.toStringAsFixed(0)}",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
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
              fontSize: 12,
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
            fontSize: 12,
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
            fontSize: 12,
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

  double _getOriginX(Size size) {
    return size.width / 2;
  }

  double _getOriginY(Size size) {
    return size.height / 2;
  }
}
