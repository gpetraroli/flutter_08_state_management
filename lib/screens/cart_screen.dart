import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart' show CartModel;
import '../models/orders_model.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartModel>(context);
    final orderData = Provider.of<OrdersModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '€ ${cartData.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {
                      orderData.addOrder(
                        cartData.items.values.toList(),
                        cartData.totalAmount,
                      );
                      cartData.clearCart();
                    },
                    child: const Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => CartItem(
              cartData.items.values.toList()[index].id,
              cartData.items.keys.toList()[index],
              cartData.items.values.toList()[index].price,
              cartData.items.values.toList()[index].quantity,
              cartData.items.values.toList()[index].title,
            ),
            itemCount: cartData.itemsCount,
          )),
        ],
      ),
    );
  }
}
