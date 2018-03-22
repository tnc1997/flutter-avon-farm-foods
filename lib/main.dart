import 'dart:convert';

import 'package:avon_farm_foods/enums/theme.dart';
import 'package:avon_farm_foods/models/configuration.dart';
import 'package:avon_farm_foods/pages/basket.dart';
import 'package:avon_farm_foods/pages/checkout.dart';
import 'package:avon_farm_foods/pages/home.dart';
import 'package:avon_farm_foods/pages/orders.dart';
import 'package:avon_farm_foods/pages/products.dart';
import 'package:avon_farm_foods/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    new FutureBuilder<SharedPreferences>(
      builder: (
        BuildContext context,
        AsyncSnapshot<SharedPreferences> snapshot,
      ) {
        return snapshot.hasData ? new MyApp(snapshot.data) : new SplashScreen();
      },
      future: SharedPreferences.getInstance(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp(this.preferences);

  final SharedPreferences preferences;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Configuration get _configuration {
    if (widget.preferences.getString('configuration') == null) {
      Configuration configuration = new Configuration();

      _configurationUpdater(configuration);

      return configuration;
    } else {
      return new Configuration.fromJson(
        JSON.decode(
          widget.preferences.getString('configuration'),
        ),
      );
    }
  }

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
      widget.preferences.setString(
        'configuration',
        JSON.encode(configuration),
      );
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

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Container(
        child: new Image.asset(
          'images/splash_screen.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
