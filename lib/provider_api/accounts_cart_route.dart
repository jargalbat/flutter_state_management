import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account_provider.dart';

class AccountsCartRoute extends StatefulWidget {
  const AccountsCartRoute({Key? key}) : super(key: key);

  @override
  _AccountsCartRouteState createState() => _AccountsCartRouteState();
}

class _AccountsCartRouteState extends State<AccountsCartRoute> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AccountProvider(),
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
              child: Consumer<AccountProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  // return Text('${context.watch<ProductProvider>().productList.length}');
                  return Text('${AccountProvider().acntList.length}');
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.clear),
            onPressed: () {
              // context.read<ProductProvider>().productList.clear();
              AccountProvider().clear();
            }),
      ),
    );
  }
}
