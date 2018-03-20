import 'package:avon_farm_foods/pages/basket.dart';
import 'package:avon_farm_foods/pages/checkout.dart';
import 'package:avon_farm_foods/pages/home.dart';
import 'package:avon_farm_foods/pages/orders.dart';
import 'package:avon_farm_foods/pages/products.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/basket': (BuildContext context) => new BasketPage(),
        '/checkout': (BuildContext context) => new CheckoutPage(),
        '/orders': (BuildContext context) => new OrdersPage(),
        '/products': (BuildContext context) => new ProductsPage(),
      },
      theme: new ThemeData.dark(),
      title: 'Avon Farm Foods',
    );
  }
}
