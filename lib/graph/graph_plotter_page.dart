import 'package:flutter/material.dart';
import 'package:flutter_concepts/graph/axes_painter.dart';
import 'package:flutter_concepts/graph/graph_painter.dart';
import 'package:flutter_concepts/graph/widgets/graph_data_tile.dart';

import 'models/graph.dart';

class GraphPlotterPage extends StatefulWidget {
  @override
  _GraphPlotterPageState createState() => _GraphPlotterPageState();
}

class _GraphPlotterPageState extends State<GraphPlotterPage> {
  double scaleFactor = 20;
  final graphs = <Graph>[];

  @override
  void initState() {
    super.initState();
    graphs.add(
      Graph(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        color: Colors.red,
        function: 'x^3',
        isVisible: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Graph Plotter"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.black12,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: <Widget>[
                    ...graphs.map(
                      (e) => GraphDataTile(e, onChange: onChange),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: CustomPaint(
                      isComplex: true,
                      painter: AxesPainter(scaleFactor),
                      child: Container(),
                    ),
                  ),
                  ...graphs.map(
                    (e) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: CustomPaint(
                        isComplex: true,
                        painter: GraphPainter(scaleFactor, e),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onChange(
    String text,
    Graph graph,
  ) {
    graphs.removeWhere((element) => element.id == graph.id);
    setState(() {
      graphs.add(graph);
    });
  }
}
