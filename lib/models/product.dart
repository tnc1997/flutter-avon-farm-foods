class Product implements Comparable<Product> {
  Product({
    this.description,
    this.id,
    this.isFavourite = false,
    this.isInBasket = false,
    this.name,
    this.price,
    this.quantity = 0,
    this.url,
  });

  final String description;
  final int id;
  final String name;
  final double price;
  final String url;

  bool isFavourite;
  bool isInBasket;
  int quantity;

  @override
  int compareTo(Product other) => id - other.id;

  bool operator ==(other) => other is Product && other.id == id;
  int get hashCode => id.hashCode;
}
