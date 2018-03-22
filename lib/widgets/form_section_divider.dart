import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormSectionDividerWidget extends StatelessWidget {
  FormSectionDividerWidget({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        child: new Text(
          title,
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        padding: new EdgeInsets.symmetric(vertical: 16.0),
      ),
      decoration: new BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
