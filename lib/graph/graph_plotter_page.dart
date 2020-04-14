import 'package:flutter/material.dart';

import 'graph_painter.dart';

class GraphPlotterPage extends StatefulWidget {
  @override
  _GraphPlotterPageState createState() => _GraphPlotterPageState();
}

class _GraphPlotterPageState extends State<GraphPlotterPage> {
  double scaleFactor = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Graph Plotter"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 250,
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
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.graphic_eq,
                          color: Colors.red,
                        ),
                        title: Text("y = x^2"),
                        trailing: Icon(
                          Icons.done,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.graphic_eq,
                          color: Colors.green,
                        ),
                        trailing: Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                          size: 20,
                        ),
                        title: Text("y = x^3"),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: CustomPaint(
                            isComplex: true,
                            painter: GraphPainter(scaleFactor),
                            child: Container(),
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 4),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Zoom"),
                            SizedBox(
                              width: 16,
                            ),
                            Text("-"),
                            Slider(
                              min: 10,
                              max: 50,
                              value: scaleFactor,
                              onChanged: (value) {
                                setState(() {
                                  scaleFactor = value;
                                });
                              },
                            ),
                            Text("+"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
