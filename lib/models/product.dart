class Product {
  Product({
    this.description,
    this.id,
    this.isFavourite = false,
    this.isInBasket = false,
    this.name,
    this.price,
    this.url,
  });

  final String description;
  final int id;
  final String name;
  final double price;
  final String url;

  bool isFavourite;
  bool isInBasket;
}
