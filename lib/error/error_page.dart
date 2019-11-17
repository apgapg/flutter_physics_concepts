import 'package:flutter/material.dart';
import 'package:flutter_concepts/common/about_widget.dart';
import 'package:flutter_concepts/error/error_card.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage>
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
        title: Text("Error Analysis"),
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
                ErrorCard(),
                AboutWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
