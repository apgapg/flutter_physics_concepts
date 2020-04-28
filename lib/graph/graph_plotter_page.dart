import 'package:flutter/material.dart';
import 'package:flutter_concepts/graph/axes_painter.dart';
import 'package:flutter_concepts/graph/graph_painter.dart';
import 'package:flutter_concepts/graph/widgets/graph_data_tile.dart';
import 'package:uuid/uuid.dart';

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
        id: Uuid().v1(),
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
                      (e) => Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: GraphDataTile(
                          e,
                          onChange: onChange,
                          key: ValueKey<String>(e.id),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      child: Text('+ ADD MORE'),
                      onPressed: () {
                        setState(() {
                          graphs.add(
                            Graph(
                              id: Uuid().v1(),
                              color: Colors.blue,
                              function: 'x^3',
                              isVisible: true,
                            ),
                          );
                        });
                      },
                    )
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

  void onChange(Graph graph) {
    final index = graphs.indexOf(graph);

    graphs.remove(graph);
    setState(() {
      graphs.insert(index, graph);
    });
  }
}
