import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/orders_model.dart' show OrdersModel;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItem(ordersData.orders[index]),
        itemCount: ordersData.ordersCount,
      ),
    );
  }
}
