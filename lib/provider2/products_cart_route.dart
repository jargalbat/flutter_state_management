import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductsCartRoute extends StatefulWidget {
  const ProductsCartRoute({Key? key}) : super(key: key);

  @override
  _ProductsCartRouteState createState() => _ProductsCartRouteState();
}

class _ProductsCartRouteState extends State<ProductsCartRoute> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProductsCartRoute'),
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
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.clear),
            onPressed: () {
              // context.read<ProductProvider>().productList.clear();
              ProductProvider().clear();
            }),
      ),
    );
  }
}
