import 'package:flutter/material.dart';
import 'package:flutter_concepts/wave/common/wave_equation.dart';
import 'package:flutter_concepts/wave/common/wave_painter.dart';
import 'package:flutter_concepts/wave/common/wave_title.dart';
import 'package:flutter_concepts/wave/model/overlapping_waves.dart';

class OverlappingWaveMotion extends StatefulWidget {
  final OverlappingWaves model;
  final double time;

  OverlappingWaveMotion(
    this.model,
    this.time,
  );

  @override
  _OverlappingWaveMotionState createState() => _OverlappingWaveMotionState();
}

class _OverlappingWaveMotionState extends State<OverlappingWaveMotion>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "${widget.model.title}",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          if (widget.model.description != null)
            Text(
              "${widget.model.description}",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
              softWrap: true,
            ),
          SizedBox(
            height: 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final wave in widget.model.list) WaveTitle(wave),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (final wave in widget.model.list.reversed)
                CustomPaint(
                  painter: WavePainter(wave, widget.time),
                  child: Container(
                    height: (wave.amplitude * 2) + 64,
                  ),
                ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final wave in widget.model.list) WaveEquation(wave),
            ],
          ),
        ],
      ),
    );
  }
}
