import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   final product= Provider.of<Product>(context,listen: false);
   final cart = Provider.of<Cart>(context,listen: false);
   print('Rebuilt');
    return ClipRRect(
      borderRadius : BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(

            builder: (ctx,product,_) =>IconButton( icon: product.isFav?Icon(Icons.favorite):Icon(Icons.favorite_border),color: Theme.of(context).accentColor,onPressed: (){            product.toggleFav();
            },) ,
          )
          ,
          title: Text(product.imageUrl,textAlign: TextAlign.center,),
          trailing: IconButton(icon: Icon(Icons.shopping_cart),color: Theme.of(context).accentColor,onPressed: (){
            cart.addItem(product.id, product.title, product.price);
          },),
        ),
      ),
    );
  }
}
