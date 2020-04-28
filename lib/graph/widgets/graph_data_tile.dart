import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_concepts/graph/models/graph.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class GraphDataTile extends StatefulWidget {
  final Graph graph;
  final void Function(Graph graph) onChange;

  GraphDataTile(
    this.graph, {
    this.onChange,
    Key key,
  }) : super(key: key);

  @override
  _GraphDataTileState createState() => _GraphDataTileState();
}

class _GraphDataTileState extends State<GraphDataTile> {
  TextEditingController _controller = TextEditingController();

  Graph graph;

  @override
  void initState() {
    super.initState();
    graph = widget.graph;

    _controller = TextEditingController.fromValue(
      TextEditingValue(text: widget.graph.function),
    );
    _controller.addListener(() {
      graph = graph.copyWith(function: _controller.text);
      widget.onChange(
        widget.graph.copyWith(function: _controller.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: GestureDetector(
          child: Icon(
            Icons.graphic_eq,
            color: graph.color,
          ),
          onTap: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: const Text('Pick color'),
                content: SingleChildScrollView(
                  child: BlockPicker(
                    pickerColor: graph.color,
                    onColorChanged: changeColor,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
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
                  hintText: graph.function,
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
          child: Icon(
            graph.isVisible ? LineAwesomeIcons.eye : LineAwesomeIcons.eye_slash,
            color: graph.color,
          ),
          onTap: () {
            setState(() {
              graph = graph.copyWith(isVisible: !graph.isVisible);
            });
            widget.onChange(graph);
          },
        ),
      ),
    );
  }

  void changeColor(Color color) {
    graph = graph.copyWith(color: color);
    widget.onChange(graph);
    Navigator.pop(context);
  }
}
