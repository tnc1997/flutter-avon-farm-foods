import 'package:avon_farm_foods/models/page.dart';
import 'package:avon_farm_foods/widgets/drawer_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final List<Page> _pages = [
    new Page(
      icon: new Icon(Icons.home),
      route: 'home',
      title: 'Home',
    ),
    new Page(
      icon: new Icon(Icons.search),
      route: 'products',
      title: 'Products',
    ),
    new Page(
      icon: new Icon(Icons.shopping_basket),
      route: 'basket',
      title: 'Basket',
    ),
    new Page(
      icon: new Icon(Icons.receipt),
      route: 'orders',
      title: 'Orders',
    ),
    new Page(
      icon: new Icon(Icons.settings),
      route: 'settings',
      title: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: _pages.map((Page page) {
          return new DrawerPageWidget(
            onTap: () => Navigator.of(context).pushNamed(page.route),
            page: page,
          );
        }).toList(),
      ),
    );
  }
}
