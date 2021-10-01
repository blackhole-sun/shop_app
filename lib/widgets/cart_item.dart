import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  CartItemWidget(this.title, this.price, this.quantity, this.id,this.productId);



  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);

      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),

        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,color: Colors.white,size: 40,),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity '),
          ),
        ),
      ),
    );
  }
}
