import 'package:flutter/material.dart';
import 'package:flutter_concepts/utils/app_utils.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: <Widget>[
          Text(
            "To learn more visit me at Unacademy below",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "https://unacademy.com/@ayushpgupta",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              onTap: () {
                openLink("https://unacademy.com/@ayushpgupta", "Unacademy");
                //js.context.callMethod("open", ["https://unacademy.com/@ayushpgupta"]);
              })
        ],
      ),
    );
  }
}
