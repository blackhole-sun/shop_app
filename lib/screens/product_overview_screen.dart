import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import '../widgets/product_grid_widget.dart';
import '../widgets/badge.dart';

enum FilterOption { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFav = false;

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Shopify Pro'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    showFav = true;
                  } else {
                    showFav = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favourite'),
                  value: FilterOption.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOption.All,
                )
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                child: ch,
                value: cartData.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        body: ProductGridWidget(showFav));
  }
}
