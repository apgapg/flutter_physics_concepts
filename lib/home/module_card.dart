import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  ModuleCard(
    this.title,
    this.description,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.display1.copyWith(
                      fontSize: 14,
                    ),
                softWrap: true,
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
