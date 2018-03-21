import 'package:avon_farm_foods/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  ProductCardWidget({
    Key key,
    @required this.onPressedMoreInfo,
    @required this.onToggledFavourite,
    @required this.onToggledInBasket,
    @required this.product,
  })
      : super(key: key);

  final VoidCallback onPressedMoreInfo;
  final VoidCallback onToggledFavourite;
  final VoidCallback onToggledInBasket;
  final Product product;

  @override
  _ProductCardWidgetState createState() => new _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image.asset(
            widget.product.url,
            fit: BoxFit.cover,
          ),
          new ListTile(
            leading: new CircleAvatar(
              child: new Text(
                '${widget.product.id.toString()}',
                style: new TextStyle(fontSize: 14.0),
              ),
            ),
            subtitle: new Text('£${widget.product.price.toString()}'),
            title: new Text(
              widget.product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.info),
                  onPressed: widget.onPressedMoreInfo,
                ),
                new IconButton(
                  icon: new Icon(
                    Icons.shopping_basket,
                    color: widget.product.isInBasket
                        ? Theme.of(context).textTheme.title.color
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: widget.onToggledInBasket,
                ),
                new IconButton(
                  icon: new Icon(
                    Icons.favorite,
                    color: widget.product.isFavourite
                        ? Colors.red
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: widget.onToggledFavourite,
                ),
              ],
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
