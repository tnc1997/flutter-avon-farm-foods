import 'package:avon_farm_foods/enums/theme.dart';
import 'package:avon_farm_foods/models/configuration.dart';
import 'package:avon_farm_foods/pages/basket.dart';
import 'package:avon_farm_foods/pages/checkout.dart';
import 'package:avon_farm_foods/pages/home.dart';
import 'package:avon_farm_foods/pages/orders.dart';
import 'package:avon_farm_foods/pages/products.dart';
import 'package:avon_farm_foods/pages/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Configuration _configuration = new Configuration(
    theme: AppTheme.dark,
  );

  ThemeData get _theme {
    switch (_configuration.theme) {
      case AppTheme.dark:
        return new ThemeData.dark();
      case AppTheme.light:
        return new ThemeData.light();
      default:
        return null;
    }
  }

  void _configurationUpdater(Configuration configuration) {
    setState(() {
      _configuration = configuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        '/basket': (BuildContext context) => new BasketPage(),
        '/checkout': (BuildContext context) => new CheckoutPage(),
        '/orders': (BuildContext context) => new OrdersPage(),
        '/products': (BuildContext context) => new ProductsPage(),
        '/settings': (BuildContext context) {
          return new SettingsPage(
            _configuration,
            _configurationUpdater,
          );
        },
      },
      theme: _theme,
      title: 'Avon Farm Foods',
    );
  }
}
