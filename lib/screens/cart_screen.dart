import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                    "\$" + cart.totalAmount.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.subtitle1.color,
                    ),
                  )),
                  FlatButton(
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.item.length,
                itemBuilder: (ctx, i) => CartItemWidget(
                    cart.item.values.toList()[i].title,
                    cart.item.values.toList()[i].price,
                    cart.item.values.toList()[i].quantity,
                    cart.item.values.toList()[i].id,cart.item.keys.toList()[i])),
          )
        ],
      ),
    );
  }
}
