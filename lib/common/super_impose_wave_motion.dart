import 'package:flutter/material.dart';
import 'package:flutter_concepts/common/super_impose_wave_painter.dart';
import 'package:flutter_concepts/common/wave_equation.dart';
import 'package:flutter_concepts/common/wave_painter.dart';
import 'package:flutter_concepts/common/wave_title.dart';
import 'package:flutter_concepts/model/super_impose_waves.dart';

class SuperImposeWaveMotion extends StatefulWidget {
  final SuperImposeWaves model;
  final double time;

  SuperImposeWaveMotion(
    this.model,
    this.time,
  );

  @override
  _SuperImposeWaveMotionState createState() => _SuperImposeWaveMotionState();
}

class _SuperImposeWaveMotionState extends State<SuperImposeWaveMotion>
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
              CustomPaint(
                painter: SuperImposeWavePainter(
                    widget.model.list, widget.time, Colors.green),
                child: Container(
                  height: (widget.model.list[0].amplitude * 5) + 64,
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
