import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_notifier.dart';

class CartRoute extends StatefulWidget {
  const CartRoute({Key? key}) : super(key: key);

  @override
  _CartRouteState createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
              padding: const EdgeInsets.all(5.0),
              child: Consumer<CartNotifier>(
                builder: (BuildContext context, value, Widget? child) {
                  return Text('${context.watch<CartNotifier>().count}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => context.read<CartNotifier>().subtract(1),
              child: const Text('Subtract'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartNotifier>(context, listen: false).clear();
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
