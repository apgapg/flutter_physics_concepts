import 'package:flutter/material.dart';
import 'package:flutter_concepts/wave/common/wave_equation.dart';
import 'package:flutter_concepts/wave/common/wave_painter.dart';
import 'package:flutter_concepts/wave/common/wave_title.dart';
import 'package:flutter_concepts/wave/model/wave.dart';

class WaveMotion extends StatefulWidget {
  final Wave wave;
  final double time;

  WaveMotion(this.wave, this.time);

  @override
  _WaveMotionState createState() => _WaveMotionState();
}

class _WaveMotionState extends State<WaveMotion>
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
            "${widget.wave.title}",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          if (widget.wave.description != null)
            Text(
              "${widget.wave.description}",
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
          WaveTitle(widget.wave),
          CustomPaint(
            painter: WavePainter(widget.wave, widget.time),
            child: Container(
              height: (widget.wave.amplitude * 2) + 64,
            ),
          ),
          WaveEquation(widget.wave),
        ],
      ),
    );
  }
}
