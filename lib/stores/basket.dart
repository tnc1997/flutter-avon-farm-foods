import 'package:avon_farm_foods/models/product.dart';
import 'package:flutter_flux/flutter_flux.dart';

class BasketStore extends Store {
  BasketStore() {
    triggerOnAction(addProductToBasket, (product) {
      _products.add(product);
      _products.sort();
    });

    triggerOnAction(clearBasket, (_) {
      _products.clear();
    });

    triggerOnAction(removeProductFromBasket, (product) {
      _products.remove(product);
    });
  }

  final List<Product> _products = [];

  bool get isEmpty => _products.isEmpty;
  List<Product> get products => new List.unmodifiable(_products);
  double get totalPrice {
    return _products.map((Product product) {
      return product.price;
    }).reduce((double accumulator, double currentValue) {
      return accumulator + currentValue;
    });
  }

  bool contains(Product product) => _products.contains(product);
}

final StoreToken basketStoreToken = new StoreToken(new BasketStore());

final Action<Product> addProductToBasket = new Action<Product>();
final Action<void> clearBasket = new Action<void>();
final Action<Product> removeProductFromBasket = new Action<Product>();
