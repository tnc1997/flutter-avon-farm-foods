import 'package:avon_farm_foods/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductListTileWidget extends StatelessWidget {
  ProductListTileWidget({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        child: new Text(
          '${product.id}',
          style: new TextStyle(fontSize: 14.0),
        ),
      ),
      subtitle: new Text('£${product.price}'),
      title: new Text(product.name),
    );
  }
}
