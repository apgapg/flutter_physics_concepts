import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/model/wave.dart';

class SuperImposeWavePainter extends CustomPainter {
  final List<Wave> list;
  final Paint _axisPaint = Paint()
    ..color = Colors.grey[700]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  double time = 0; //ms
  Color color;

  List<Paint> _paintList;

  Paint _finalPaint;

  SuperImposeWavePainter(
    this.list,
    this.time,
    this.color,
  ) {
    _paintList = list
        .map((wave) => Paint()
          ..color = wave.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = wave.width)
        .toList(growable: false);
    _finalPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final x0 = 0.0;
    final y0 = size.height / 2;
    final width = size.width;

    drawAxes(canvas, size);

    final wavePathList = [...list.map((wave) => Path())];
    final finalWavePath = Path();
    finalWavePath.reset();

    for (final wavePath in wavePathList) {
      final wave = list[wavePathList.indexOf(wavePath)];
      wavePath.reset();
      wavePath.moveTo(x0, y0 - _calculateY(x0.toInt(), wave));
      wavePath.addOval(Rect.fromCircle(
          center: Offset(x0, y0 - _calculateY(x0.toInt(), wave)), radius: 4));
    }

    for (int x = x0.toInt(); x < width; x++) {
      var xft = x.toDouble();
      var yft = 0.0;
      for (final wave in list) {
        var index = list.indexOf(wave);
        final xt = x.toDouble();
        final yt = _calculateY(x, wave);
        yft += yt;
        final wavePath = wavePathList[index];
        wavePath.lineTo(xt, y0 - yt);
      }
      if (xft == 0) {
        finalWavePath.moveTo(xft, y0 - yft);
        finalWavePath
            .addOval(Rect.fromCircle(center: Offset(xft, y0 - yft), radius: 4));
      }
      finalWavePath.lineTo(xft, y0 - yft);
    }

    for (final wavePath in wavePathList) {
      var index = wavePathList.indexOf(wavePath);
      canvas.drawPath(wavePath, _paintList[index]);
    }
    canvas.drawPath(finalWavePath, _finalPaint);
  }

  @override
  bool shouldRepaint(SuperImposeWavePainter oldDelegate) {
    return time != oldDelegate.time;
  }

  double _calculateY(int x, Wave wave) {
    var y;
    if (wave.forward)
      y = _amplitude(wave) *
          sin((_calculateK(wave) * x) -
              (_calculateW(wave) * _time()) +
              wave.phase);
    else
      y = _amplitude(wave) *
          sin((_calculateK(wave) * x) +
              (_calculateW(wave) * _time()) +
              wave.phase);

    return y;
  }

  double _calculateW(Wave wave) {
    return (2 * pi) * wave.frequency;
  }

  double _time() {
    return time / 1000; //sec
  }

  double _calculateK(Wave wave) {
    return (2 * pi) / wave.wavelength;
  }

  double _amplitude(Wave wave) {
    return wave.amplitude;
  }

  void drawAxes(Canvas canvas, Size size) {
    final x0 = 0.0;
    final y0 = size.height / 2;
    final width = size.width;
    final yAxisPath = Path();
    yAxisPath.reset();
    yAxisPath.moveTo(x0, 8);
    yAxisPath.lineTo(x0, size.height - 8);
    canvas.drawPath(yAxisPath, _axisPaint);

    final xAxisPath = Path();
    xAxisPath.reset();
    xAxisPath.moveTo(x0, y0);
    xAxisPath.lineTo(width, y0);
    canvas.drawPath(xAxisPath, _axisPaint);
  }
}
