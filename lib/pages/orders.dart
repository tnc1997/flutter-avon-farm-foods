import 'package:avon_farm_foods/models/order.dart';
import 'package:avon_farm_foods/models/product.dart';
import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:avon_farm_foods/widgets/order_list_tile.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => new _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  _OrdersPageState() {
    _orders = new List<Order>.generate(25, (int index) {
      return new Order(
        date: new DateTime.now().subtract(
          new Duration(days: index * 7),
        ),
        delivery: new DateTime.now().subtract(
          new Duration(days: (index * 7) - 3),
        ),
        id: (25 - index) * 1000,
        products: [
          new Product(
            id: index + 1,
            name: 'Product ${index + 1}',
            price: 1.99,
            url: 'images/home.jpg',
          ),
        ],
        total: 1.99,
      );
    });
  }

  List<Order> _orders;

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Orders'),
    );
  }

  ListView _buildOrdersList() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new OrderListTileWidget(
            order: _orders[index],
          ),
          decoration: new BoxDecoration(
            border: new Border(
              bottom: new BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
        );
      },
      itemCount: _orders.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildOrdersList(),
      drawer: new DrawerWidget(),
    );
  }
}
