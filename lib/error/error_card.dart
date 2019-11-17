import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_concepts/utils/screen_utils.dart';
import 'package:json_table/json_table.dart';

class ErrorCard extends StatefulWidget {
  ErrorCard();

  @override
  _ErrorCardState createState() => _ErrorCardState();
}

class _ErrorCardState extends State<ErrorCard>
    with SingleTickerProviderStateMixin {
  List map = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= 20; i++) {
      var r2 = 14.0;
      var r1 = (12 + (14 - 12) / 20 * i);
      var a1 = (math.pi * r2 * r2) - (math.pi * r1 * r1);
      var a2 = 2 * math.pi * r1 * (r2 - r1);
      map.add({
        "R₂": r2.toStringAsFixed(1),
        "R₁": r1.toStringAsFixed(1),
        "A₁": a1.toStringAsFixed(1),
        "A₂": a2.toStringAsFixed(1),
        "ΔR = R₂-R₁": (r2-r1).toStringAsFixed(1),
        "ΔA = A₁-A₂": (a1 - a2).toStringAsFixed(1),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      JsonTable(map),
      Image.asset(
        'assets/images/disc.png',
        height: 300,
      ),
    ];
    return Container(
      color: Colors.grey[200],
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Difference between Areas of Donut by two Formulae",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Here we are calculating the difference between Areas of Donut given by two formulae.\n"
            "A₁ is the correct formula to calculate area.\n"
            "A₂ is the formula that we use while calculating elemental area.\n\n"
            "We are trying to prove that why A₂ holds good when R₂ - R₁ or difference between two radii is very very small.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "A₁ = πR₂² - πR₁²"
            "\n"
            "A₂ = 2πR₁ (R₂ - R₁) = 2πR₁ ΔR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: isSmallScreen(context) ? 8 : 32,
          ),
          isSmallScreen(context)
              ? Column(
                  children: children.reversed.toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: children,
                ),
          SizedBox(
            height: 16,
          ),
          Text(
            "With the decrease of difference between two radii, both the area formula gives similar result."
            "\nHence the formula we use for elemental ring area calculation holds good.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
