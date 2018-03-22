import 'package:avon_farm_foods/models/checkout.dart';
import 'package:avon_farm_foods/stores/basket.dart';
import 'package:avon_farm_foods/widgets/form_section_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => new _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with StoreWatcherMixin<CheckoutPage> {
  BasketStore _basketStore;
  Checkout _checkout = new Checkout();
  bool _shouldAutoValidate = false;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final EdgeInsets _formSectionPadding = new EdgeInsets.fromLTRB(
    16.0,
    0.0,
    16.0,
    16.0,
  );

  @override
  void initState() {
    super.initState();

    _basketStore = listenToStore(basketStoreToken);
  }

  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Checkout'),
      actions: <Widget>[
        new Column(
          children: [
            new Container(
              child: new Text('£${_basketStore.total.toStringAsFixed(2)}'),
              padding: new EdgeInsets.only(right: 8.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }

  Form _buildForm() {
    return new Form(
      autovalidate: _shouldAutoValidate,
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new FormSectionDividerWidget(title: 'Personal Details'),
            new Container(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'First Name',
                    ),
                    onSaved: (String value) => _checkout.firstName = value,
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your first name.'
                          : null;
                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Last Name',
                    ),
                    onSaved: (String value) => _checkout.lastName = value,
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your last name.'
                          : null;
                    },
                  ),
                ],
              ),
              padding: _formSectionPadding,
            ),
            new FormSectionDividerWidget(title: 'Delivery Details'),
            new Container(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Address',
                    ),
                    onSaved: (String value) => _checkout.address = value,
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your delivery address.'
                          : null;
                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Postcode',
                    ),
                    onSaved: (String value) => _checkout.postcode = value,
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your delivery postcode.'
                          : null;
                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Telephone',
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (String value) {
                      return _checkout.telephone = int.parse(value);
                    },
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your contact telephone.'
                          : null;
                    },
                  ),
                ],
              ),
              padding: _formSectionPadding,
            ),
            new FormSectionDividerWidget(title: 'Payment Details'),
            new Container(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: '1111222233334444',
                      labelText: 'Card Number',
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {
                      return _checkout.cardNumber = int.parse(value);
                    },
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your card number.'
                          : null;
                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'MM/YY',
                      labelText: 'Expiry Date',
                    ),
                    keyboardType: TextInputType.datetime,
                    onSaved: (String value) => _checkout.expiryDate = value,
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your expiry date.'
                          : null;
                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: '123',
                      labelText: 'CVV Number',
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {
                      return _checkout.cvv = int.parse(value);
                    },
                    validator: (String value) {
                      return value.isEmpty
                          ? 'Please enter your card verification value.'
                          : null;
                    },
                  ),
                ],
              ),
              padding: _formSectionPadding,
            ),
            new Container(
              child: new RaisedButton(
                child: new Text('Pay Now'),
                onPressed: _handleSubmitted,
              ),
              padding: _formSectionPadding,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
      key: _formKey,
    );
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      _shouldAutoValidate = true;
    } else {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildForm(),
    );
  }
}
