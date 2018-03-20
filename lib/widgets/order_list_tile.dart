import 'package:avon_farm_foods/models/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderListTileWidget extends StatelessWidget {
  OrderListTileWidget({
    Key key,
    @required this.order,
  })
      : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      isThreeLine: true,
      subtitle: new Text(
        '${order.date.toIso8601String().substring(0, 10)}\n${order.delivery.toIso8601String().substring(0, 10)}',
      ),
      title: new Text('${order.id}'),
      trailing: new Text('£${order.total}'),
    );
  }
}
