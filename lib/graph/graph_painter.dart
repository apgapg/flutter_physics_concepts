import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_concepts/graph/models/graph.dart';
import 'package:math_expressions/math_expressions.dart';

class GraphPainter extends CustomPainter {
  final Paint _graphPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;
  final scaleFactor;
  final Graph graph;
  final p = Parser();
  Expression exp;
  final cm = ContextModel();

  bool _showGraph = true;

  GraphPainter(this.scaleFactor, this.graph) {
    try {
      exp = p.parse("${graph.function}");
      _showGraph = graph.isVisible;
      _graphPaint.color = graph.color;
    } catch (e) {
      print(e);
      _showGraph = false;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_showGraph) drawGraph(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawGraph(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    final graphPathPositive = Path();
    final graphPathNegative = Path();

    final y = _getY(0);

    graphPathPositive.moveTo(x0, getY(y, y0));
    graphPathNegative.moveTo(x0, getY(y, y0));
    print(getY(_getY(x0), y0));
    for (double x = 0; x < x0; x += 0.1) {
      final y = _getY(x);
      graphPathPositive.lineTo(getX(x, x0), getY(y, y0));
      final y2 = _getY(-x);
      graphPathNegative.lineTo(getX(-x, x0), getY(y2, y0));
    }
    canvas.drawPath(graphPathPositive, _graphPaint);
    canvas.drawPath(graphPathNegative, _graphPaint);
  }

  double getY(double y, double y0) {
    return y0 - (y * scaleFactor);
  }

  double getX(double x, double x0) {
    return x0 + (x * scaleFactor);
  }

  double _getY(double x) {
    cm.bindVariable(Variable('x'), Number(x));
    return exp.evaluate(EvaluationType.REAL, cm);
  }
}
