import 'package:avon_farm_foods/enums/clear_basket_dialog_action.dart';
import 'package:avon_farm_foods/models/product.dart';
import 'package:avon_farm_foods/stores/basket.dart';
import 'package:avon_farm_foods/widgets/dismissible_list_tile.dart';
import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:avon_farm_foods/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => new _BasketPageState();
}

class _BasketPageState extends State<BasketPage>
    with StoreWatcherMixin<BasketPage> {
  BasketStore _basketStore;
  List<Product> _products;

  @override
  void initState() {
    super.initState();

    _basketStore = listenToStore(basketStoreToken, _handleBasketStoreChanged);

    _products = _basketStore.products;
  }

  List<Widget> _buildActions() {
    return [
      new IconButton(
        icon: new Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            child: _buildDialog(),
          ).then((value) {
            if (value == ClearBasketDialogAction.yes) clearBasket();
          });
        },
        tooltip: 'Clear Basket',
      ),
      new IconButton(
        icon: new Icon(Icons.payment),
        onPressed: null,
        tooltip: 'Enter Checkout',
      ),
    ];
  }

  AppBar _buildAppBar() {
    return new AppBar(
      actions: _buildActions(),
      title: new Text('Basket'),
    );
  }

  AlertDialog _buildDialog() {
    return new AlertDialog(
      actions: _buildDialogActions(),
      content: new Text('Are you sure you want to clear your basket?'),
      title: new Text('Clear Basket'),
    );
  }

  List<Widget> _buildDialogActions() {
    return [
      new ButtonTheme.bar(
        child: new ButtonBar(
          children: <Widget>[
            _buildDialogButton('NO', ClearBasketDialogAction.no),
            _buildDialogButton('YES', ClearBasketDialogAction.yes),
          ],
        ),
      ),
    ];
  }

  FlatButton _buildDialogButton(String text, ClearBasketDialogAction action) {
    return new FlatButton(
      child: new Text(text),
      onPressed: () {
        return Navigator.pop(
          context,
          action,
        );
      },
    );
  }

  void _handleBasketStoreChanged(BasketStore basketStore) {
    _products = basketStore.products;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: new ListView(
        children: _products.map((Product product) {
          return new DismissibleListTileWidget(
            child: new ProductListTileWidget(product: product),
            dismissedSnackBar: new SnackBar(
              action: new SnackBarAction(
                label: 'UNDO',
                onPressed: () => addProductToBasket(product),
              ),
              content: new Text('Product Removed'),
            ),
            dismissibleBackgroundIcon: new Icon(Icons.delete),
            key: new ObjectKey(product),
            onDismissed: (DismissDirection direction) {
              removeProductFromBasket(product);
            },
          );
        }).toList(),
      ),
      drawer: new DrawerWidget(),
    );
  }
}