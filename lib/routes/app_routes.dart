import 'package:flutter/material.dart';
import 'package:flutter_concepts/error/error_page.dart';
import 'package:flutter_concepts/graph/graph_plotter_page.dart';
import 'package:flutter_concepts/home/home_page.dart';
import 'package:flutter_concepts/optics/optics_page.dart';
import 'package:flutter_concepts/wave/wave_page.dart';

import 'routes.dart';

class AppRoutes {
  /// Add entry for new route here
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return PageRouteBuilder(
          settings: RouteSettings(name: Routes.splash),
          pageBuilder: (_, a, aa) => HomePage(),
        );
      case Routes.waveMotion:
        return PageRouteBuilder(
          settings: RouteSettings(name: Routes.waveMotion),
          pageBuilder: (_, a, aa) => WavePage(),
        );
      case Routes.errorAnalysis:
        return PageRouteBuilder(
          settings: RouteSettings(name: Routes.errorAnalysis),
          pageBuilder: (_, a, aa) => ErrorPage(),
        );
      case Routes.graphPlotter:
        return PageRouteBuilder(
          settings: RouteSettings(name: Routes.graphPlotter),
          pageBuilder: (_, a, aa) => GraphPlotterPage(),
        );
      case Routes.rayOptics:
        return PageRouteBuilder(
          settings: RouteSettings(name: Routes.rayOptics),
          pageBuilder: (_, a, aa) => OpticsPage(),
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (_, a, aa) => HomePage(),
        );
    }
  }
}
