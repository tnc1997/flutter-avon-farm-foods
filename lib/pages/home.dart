import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Column _buildIconColumn(IconData icon, String label) {
    return new Column(
      children: <Widget>[
        new CircleAvatar(
          child: new Icon(
            icon,
            size: 40.0,
          ),
          radius: 30.0,
        ),
        new Container(
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          padding: new EdgeInsets.only(top: 8.0),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Avon Farm Foods'),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/home.jpg',
            fit: BoxFit.cover,
          ),
          new Container(
            child: new Text(
              'Welcome to Avon Farm Foods',
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            padding: new EdgeInsets.only(bottom: 32.0, top: 32.0),
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                _buildIconColumn(Icons.shopping_basket, 'Shopped'),
                _buildIconColumn(Icons.credit_card, 'Secured'),
                _buildIconColumn(Icons.local_shipping, 'Shipped'),
                _buildIconColumn(Icons.sentiment_very_satisfied, 'Satisfied'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
        padding: new EdgeInsets.all(16.0),
      ),
      drawer: new DrawerWidget(),
    );
  }
}
