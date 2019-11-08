import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/model/wave.dart';

class WavePainter extends CustomPainter {
  final Wave wave;
  final Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  final Paint _paint2 = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  double time = 0; //ms

  WavePainter(this.wave, this.time) {
    _paint.color = wave.color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final x0 = 0.0;
    final y0 = size.height / 2;
    final width = size.width;

    final path3 = Path();
    path3.reset();
    path3.moveTo(x0, 8);
    path3.lineTo(x0, size.height - 8);
    canvas.drawPath(path3, _paint2);

    final path2 = Path();
    path2.reset();
    path2.moveTo(x0, y0);
    path2.lineTo(width, y0);
    canvas.drawPath(path2, _paint2);

    final path = Path();
    path.reset();
    path.moveTo(x0, y0 - _calculateY(x0.toInt()));
    path.addOval(Rect.fromCircle(
        center: Offset(x0, y0 - _calculateY(x0.toInt())), radius: 4));
    for (int x = x0.toInt(); x < width; x++) {
      final xt = x.toDouble();
      final yt = y0 - _calculateY(x);
      path.lineTo(xt, yt);
    }
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return time != oldDelegate.time;
  }

  double _calculateY(int x) {
    var y;
    if (wave.forward)
      y = _amplitude() *
          sin((_calculateK() * x) - (_calculateW() * _time()) + wave.phase);
    else
      y = _amplitude() *
          sin((_calculateK() * x) + (_calculateW() * _time()) + wave.phase);

    return y;
  }

  double _calculateW() {
    return (2 * pi) * wave.frequency;
  }

  double _time() {
    return time / 1000; //sec
  }

  double _calculateK() {
    return (2 * pi) / wave.wavelength;
  }

  double _amplitude() {
    return wave.amplitude;
  }
}
