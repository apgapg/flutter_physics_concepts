import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/wave/model/wave.dart';

class WaveEquation extends StatelessWidget {
  final Wave wave;

  WaveEquation(this.wave);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "y = ${wave.amplitude} sin(${((2 * pi) / wave.wavelength).toStringAsFixed(2)}x ${wave.forward ? '-' : '+'} ${((2 * pi) * wave.frequency).toStringAsFixed(2)}t ${wave.phase.isNegative ? '-' : '+'} ${((180 / pi) * wave.phase).toStringAsFixed(0)}°)",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: wave.color,
        ),
      ),
    );
  }
}
