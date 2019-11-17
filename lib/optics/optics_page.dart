import 'package:flutter/material.dart';
import 'package:flutter_concepts/common/about_widget.dart';
import 'package:flutter_concepts/optics/ray_diagram.dart';

class OpticsPage extends StatefulWidget {
  @override
  _OpticsPageState createState() => _OpticsPageState();
}

class _OpticsPageState extends State<OpticsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 200,
      duration: const Duration(seconds: 200),
      vsync: this,
    );
    _controller.repeat();
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
        elevation: 1,
        title: Text("Optics: Convex Lens Ray Diagram"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.symmetric(
                vertical: 4,
              ),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) => Text(
                      "u = Object Distance v = Image Distance\n"
                      "f = Focal Length of Lens",
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
                RayDiagram("Object Ray Diagram of Simple Convex Lens"),
                RayDiagram(
                  "Object Ray Diagram of Simple Concave Lens",
                  f: -100,
                ),
                AboutWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
