import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/model/wave.dart';

class WaveTitle extends StatelessWidget {
  final Wave wave;

  WaveTitle(this.wave);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "A= ${wave.amplitude}  λ= ${wave.wavelength}  f= ${wave.frequency}  Φ= ${wave.phase.isNegative ? '-' : '+'} ${((180 / pi) * wave.phase).toStringAsFixed(0)}°",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: wave.color,
        ),
      ),
    );
  }
}
