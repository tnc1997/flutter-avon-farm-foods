import 'package:avon_farm_foods/models/product.dart';

class Order {
  Order({this.id, this.date, this.delivery, this.products, this.total});

  final int id;
  final DateTime date;
  final DateTime delivery;
  final List<Product> products;
  final double total;
}
