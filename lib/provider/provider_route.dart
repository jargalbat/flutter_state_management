import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

import 'cart_route.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({Key? key}) : super(key: key);

  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Provider'),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
              margin: const EdgeInsets.only(right: 15.0),
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CartRoute()));
                },
                child: Consumer<CartNotifier>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text('${context.watch<CartNotifier>().count}');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.read<CartNotifier>().add(1),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
