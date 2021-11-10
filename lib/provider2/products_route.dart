import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider2/product_provider.dart';
import 'package:provider/provider.dart';

import 'products_cart_route.dart';

class ProductsRoute extends StatefulWidget {
  const ProductsRoute({Key? key}) : super(key: key);

  @override
  _ProductsRouteState createState() => _ProductsRouteState();
}

class _ProductsRouteState extends State<ProductsRoute> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProductProvider(),
      child: const ProductsScreen(),
    );
  }
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
            margin: const EdgeInsets.only(right: 15.0),
            padding: const EdgeInsets.all(10.0),
            child: Consumer<ProductProvider>(
              builder: (BuildContext context, value, Widget? child) {
                // return Text('${context.watch<ProductProvider>().productList.length}');
                return Text('${ProductProvider().productList.length}');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.add),
            onPressed: () {
              var product = Product()
                ..id = 1
                ..name = 'test';

              context.read<ProductProvider>().add(product);
              Provider.of<ProductProvider>(context, listen: false).add(product);
              ProductProvider().add(product);
            },
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsCartRoute())),
          ),
        ],
      ),
    );
  }
}
