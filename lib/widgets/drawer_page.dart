import 'package:avon_farm_foods/models/page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerPageWidget extends StatefulWidget {
  DrawerPageWidget({
    Key key,
    @required this.onTap,
    @required this.page,
  })
      : super(key: key);

  final VoidCallback onTap;
  final Page page;

  @override
  _DrawerPageWidgetState createState() => new _DrawerPageWidgetState();
}

class _DrawerPageWidgetState extends State<DrawerPageWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: widget.page.icon,
      onTap: widget.onTap,
      title: new Text(widget.page.title),
    );
  }
}
