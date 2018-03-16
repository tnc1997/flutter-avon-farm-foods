import 'package:avon_farm_foods/models/product.dart';
import 'package:avon_farm_foods/types/predicate.dart';
import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:avon_farm_foods/widgets/predicate_tab.dart';
import 'package:avon_farm_foods/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => new _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isSearching = false;

  final List<Product> _products = [
    new Product(
      description:
          'Tender pieces of chicken in a mildly spiced curry sauce. Served with fluffy white rice.',
      id: 128,
      name: 'Hearty Chicken Curry',
      price: 4.45,
      url:
          'https://www.wiltshirefarmfoods.com/wff/media/Products/128_Hearty_Chicken_Curry_plated.jpg',
    ),
    new Product(
      description:
          'Bitesize pieces of tender chicken in rich gravy. Served with soft boiled potatoes, cauliflower, swede and carrots.',
      id: 187,
      name: 'Extra Tender Chicken in Gravy',
      price: 4.25,
      url:
          'https://www.wiltshirefarmfoods.com/wff/media/Products/187_Extra_Tender_Chicken_in_Gravy_plated.jpg',
    ),
    new Product(
      description:
          'Tender chicken in gravy, topped with shortcrust pastry. Served with mashed potato, cauliflower, carrots and green beans.',
      id: 252,
      name: 'Chicken & Vegetable Pie',
      price: 3.15,
      url:
          'https://www.wiltshirefarmfoods.com/wff/media/Products/252_Chicken_Vegetable_Pie_plated.jpg',
    ),
    new Product(
      description:
          'Steam roasted chicken breast in rich gravy. Served with parsley boiled potatoes, sliced carrots and peas.',
      id: 257,
      name: 'Chicken Breast',
      price: 3.85,
      url:
          'https://www.wiltshirefarmfoods.com/wff/media/Products/257_Chicken_Breast_plated.jpg',
    ),
    new Product(
      description:
          'Turkey with sage stuffing in gravy. Served with roast potatoes, mashed carrots and swede.',
      id: 273,
      isFavourite: true,
      name: 'Turkey with Stuffing',
      price: 4.25,
      url:
          'https://www.wiltshirefarmfoods.com/wff/media/Products/273_Turkey_with_Stuffing_plated.jpg',
    ),
  ];

  static final TextEditingController _searchQuery = new TextEditingController();
  static final Predicate<Product> _searchQueryPredicate = (Product product) {
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

  final List<PredicateTabWidget<Product>> _tabs = [
    new PredicateTabWidget(
      icon: new Icon(Icons.thumb_up),
      predicate: (Product product) => true,
      text: 'POPULAR',
    ),
    new PredicateTabWidget(
      icon: new Icon(Icons.favorite),
      predicate: (Product product) => product.isFavourite,
      text: 'FAVOURITES',
    )
  ];

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
