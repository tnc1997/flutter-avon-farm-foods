import 'package:avon_farm_foods/models/product.dart';
import 'package:avon_farm_foods/stores/basket.dart';
import 'package:avon_farm_foods/types/predicate.dart';
import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:avon_farm_foods/widgets/predicate_tab.dart';
import 'package:avon_farm_foods/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => new _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with StoreWatcherMixin<ProductsPage> {
  _ProductsPageState() {
    _products = new List<Product>.generate(999, (int index) {
      return new Product(
        description: 'Insert product description here.',
        id: index + 1,
        isPopular: (index + 1) % 100 == 0,
        name: 'Product ${index + 1}',
        price: 1.99,
        url: 'images/home.jpg',
      );
    });

    _searchQueryPredicate = (Product product) {
      if (_searchQuery.text.isEmpty) {
        return true;
      } else {
        return product.name.contains(
          new RegExp(
            _searchQuery.text,
            caseSensitive: false,
          ),
        );
      }
    };
  }

  BasketStore _basketStore;
  bool _isSearching = false;
  List<Product> _products;
  Predicate<Product> _searchQueryPredicate;

  final TextEditingController _searchQuery = new TextEditingController();

  final List<PredicateTabWidget<Product>> _tabs = [
    new PredicateTabWidget(
      icon: new Icon(Icons.list),
      predicate: (Product product) => true,
      text: 'ALL',
    ),
    new PredicateTabWidget(
      icon: new Icon(Icons.thumb_up),
      predicate: (Product product) => product.isPopular,
      text: 'POPULAR',
    ),
    new PredicateTabWidget(
      icon: new Icon(Icons.favorite),
      predicate: (Product product) => product.isFavourite,
      text: 'FAVOURITES',
    )
  ];

  @override
  void initState() {
    super.initState();

    _basketStore = listenToStore(basketStoreToken);

    _products.forEach((Product product) {
      if (_basketStore.contains(product)) product.isInBasket = true;
    });
  }

  List<Widget> _buildActions() {
    return [
      new IconButton(
        icon: new Icon(Icons.search),
        onPressed: _handleSearchBegin,
        tooltip: 'Search',
      ),
    ];
  }

  AppBar _buildAppBar() {
    return new AppBar(
      actions: _buildActions(),
      bottom: _buildTabBar(),
      title: new Text('Products'),
    );
  }

  TabBarView _buildTabBarView() {
    return new TabBarView(
      children: _tabs.map((PredicateTabWidget<Product> tab) {
        return _products
            .where(tab.predicate)
            .where(_searchQueryPredicate)
            .toList();
      }).map((List<Product> products) {
        return new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              child: new ProductCardWidget(
                onPressedMoreInfo: null,
                onToggledFavourite: () {
                  setState(() {
                    products[index].isFavourite = !products[index].isFavourite;
                  });
                },
                onToggledInBasket: () {
                  setState(() {
                    products[index].isInBasket
                        ? removeProductFromBasket(products[index])
                        : addProductToBasket(products[index]);

                    products[index].isInBasket = !products[index].isInBasket;
                  });
                },
                product: products[index],
              ),
              padding: new EdgeInsets.symmetric(vertical: 8.0),
            );
          },
          itemCount: products.length,
          padding: new EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
        );
      }).toList(),
    );
  }

  AppBar _buildSearchBar() {
    return new AppBar(
      bottom: _buildTabBar(),
      leading: new BackButton(),
      title: new TextField(
        autofocus: true,
        controller: _searchQuery,
        decoration: new InputDecoration(
          hintText: 'Search by product name',
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return new TabBar(
      indicatorColor: Theme.of(context).iconTheme.color,
      tabs: _tabs,
    );
  }

  void _handleSearchBegin() {
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
      onRemove: () {
        setState(() {
          _isSearching = false;
          _searchQuery.clear();
        });
      },
    ));

    setState(() {
      _isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      child: new Scaffold(
        appBar: _isSearching ? _buildSearchBar() : _buildAppBar(),
        body: _buildTabBarView(),
        drawer: new DrawerWidget(),
      ),
      length: _tabs.length,
    );
  }
}
