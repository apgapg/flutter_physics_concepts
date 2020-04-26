import 'package:flutter/material.dart';
import 'package:flutter_concepts/graph/models/graph.dart';

class GraphDataTile extends StatefulWidget {
  final Graph graph;
  final void Function(String text, Graph graph) onChange;

  GraphDataTile(
    this.graph, {
    this.onChange,
  });

  @override
  _GraphDataTileState createState() => _GraphDataTileState();
}

class _GraphDataTileState extends State<GraphDataTile> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController.fromValue(
      TextEditingValue(text: widget.graph.function),
    );
    _controller.addListener(() {
      widget.onChange(
        _controller.text,
        widget.graph.copyWith(function: _controller.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: GestureDetector(
          child: Icon(Icons.graphic_eq),
          onTap: () {},
        ),
        title: Row(
          children: <Widget>[
            Text('y='),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: widget.graph.function,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300],
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
          child: Icon(Icons.remove_red_eye),
          onTap: () {},
        ),
      ),
    );
  }
}
