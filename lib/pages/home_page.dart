import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_concepts/common/overlapping_wave_motion.dart';
import 'package:flutter_concepts/common/wave_motion.dart';
import 'package:flutter_concepts/model/overlapping_waves.dart';
import 'package:flutter_concepts/model/wave.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static final _wave1 = Wave(
    title: "Sinusoidal Wave travelling in forward direction with 0° phase",
    description: "- sign indicates wave moving forward",
    amplitude: 50,
    wavelength: 100,
    frequency: 1000,
    phase: 0,
    color: Colors.red,
  );
  static final _wave1b = Wave(
    title: "Sinusoidal Wave travelling in forward direction with 180° phase",
    description: "Notice how change of phase causes wave change",
    amplitude: 50,
    wavelength: 100,
    frequency: 1000,
    phase: pi,
    color: Colors.blue,
  );
  static final _wave1a = Wave(
    title: "Sinusoidal Wave travelling in backward direction",
    description: "+ sign indicated wave moves backward",
    amplitude: 50,
    wavelength: 100,
    frequency: 1000,
    phase: 0,
    color: Colors.red,
    forward: false,
  );
  static final _wave2 = Wave(
    title: "Sinusoidal Wave travelling in forward direction",
    description:
        "Notice how decreasing of wavelength but frequency fixed causes wave to slow down\n"
        "Increasing Amplitude causes wave to stretch vertically",
    amplitude: 80,
    wavelength: 70,
    frequency: 1000,
    phase: 0,
    color: Colors.green,
  );
  final list = [_wave1, _wave1b, _wave2, _wave1a];
  final overlap1 = OverlappingWaves(
    list: [_wave1, _wave2],
    title: "Different wavelength waves",
    description:
        "A better visual representation of two waves with different wavelength, amplitude but same frequency",
  );
  final overlap2 = OverlappingWaves(
    list: [
      _wave1,
      _wave1a
        ..phase = pi
        ..color = Colors.blue
      ..forward=true
    ],
    title: "Out of phase waves",
    description: "Same two waves just one of them is 180° out of phase",
  );
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 20,
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Wave Motion for IIT-JEE by Ayush P Gupta"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => Text(
                "t = ${_controller.value.toStringAsFixed(0)} sec",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => Text(
                  "A=Amplitude λ=Wavelength f=Frequency Φ=Phase\n"
                  "y=Asin(kx-wt+Φ)\n"
                  "k=2π/λ  w=2πf",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            for (final wave in list)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => WaveMotion(wave, _controller.value),
              ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => OverlappingWaveMotion(
                overlap2,
                _controller.value,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => OverlappingWaveMotion(
                overlap1,
                _controller.value,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => Column(
                  children: <Widget>[
                    Text(
                      "To learn more visit me at Unacademy below",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            "https://unacademy.com/@ayushpgupta",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        onTap: () {
                          //js.context.callMethod("open", ["https://unacademy.com/@ayushpgupta"]);
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
