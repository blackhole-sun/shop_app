import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import './product_item.dart';
import '../provider/products.dart';

class ProductGridWidget extends StatelessWidget {
  final showFav;
  ProductGridWidget(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
          child: ProductItem(
              )),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
