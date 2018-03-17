import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DismissibleListTileWidget extends StatefulWidget {
  DismissibleListTileWidget({
    @required this.child,
    this.dismissedSnackBar,
    @required this.dismissibleBackgroundIcon,
    Key key,
    @required this.onDismissed,
  })
      : super(key: key);

  @override
  _DismissibleListTileWidgetState createState() =>
      new _DismissibleListTileWidgetState();

  final Widget child;
  final SnackBar dismissedSnackBar;
  final Icon dismissibleBackgroundIcon;
  final DismissDirectionCallback onDismissed;
}

class _DismissibleListTileWidgetState extends State<DismissibleListTileWidget> {
  Container _buildBackground() {
    return new Container(
      child: new ListTile(
        trailing: widget.dismissibleBackgroundIcon,
      ),
      color: Theme.of(context).dividerColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      background: _buildBackground(),
      child: new Container(
        child: widget.child,
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          color: Theme.of(context).canvasColor,
        ),
      ),
      direction: DismissDirection.endToStart,
      key: widget.key,
      onDismissed: (DismissDirection direction) {
        widget.onDismissed(direction);

        if (widget.dismissedSnackBar != null) {
          Scaffold.of(context).showSnackBar(widget.dismissedSnackBar);
        }
      },
    );
  }
}
