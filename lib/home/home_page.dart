import 'package:flutter/material.dart';
import 'package:flutter_concepts/home/module_card.dart';
import 'package:flutter_concepts/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Physics Concepts by Ayush P Gupta",
            ),
            elevation: 1,
            centerTitle: true,
          ),
          body: Container(
            child: GridView(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              children: <Widget>[
                ModuleCard(
                  "Wave Motion",
                  "Describes different wave forms, superimposition of waves, stationary waves etc",
                  onWaveTap,
                ),
                ModuleCard(
                  "Ray Optics",
                  "Real-Time visualisation of Lens Formula, Mirror Formula etc",
                  onOpticsTap,
                ),
                ModuleCard(
                  "Error Analysis",
                  "Study the concepts of errors, their impact, comparisons etc",
                  onErrorTap,
                ),
                ModuleCard(
                  "Graph Plotter",
                  "Plot the polynomials to understand graphs visually",
                  onPlotterTap,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void onWaveTap() {
    Navigator.pushNamed(context, Routes.waveMotion);
  }

  void onOpticsTap() {
    Navigator.pushNamed(context, Routes.rayOptics);
  }

  void onErrorTap() {
    Navigator.pushNamed(context, Routes.errorAnalysis);
  }

  void onPlotterTap() {
    Navigator.pushNamed(context, Routes.graphPlotter);
  }
}
