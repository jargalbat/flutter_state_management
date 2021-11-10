import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account_provider.dart';
import 'loading_provider.dart';

class AccountsCartRoute extends StatefulWidget {
  const AccountsCartRoute({Key? key}) : super(key: key);

  @override
  _AccountsCartRouteState createState() => _AccountsCartRouteState();
}

class _AccountsCartRouteState extends State<AccountsCartRoute> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider.value(value: AccountProvider()),
      ],
      child: const AccountsCartScreen(),
    );
  }
}

class AccountsCartScreen extends StatefulWidget {
  const AccountsCartScreen({Key? key}) : super(key: key);

  @override
  _AccountsCartScreenState createState() => _AccountsCartScreenState();
}

class _AccountsCartScreenState extends State<AccountsCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
          floatingActionButton: Row(
            children: [
              FloatingActionButton(
                heroTag: 'dfg1',
                child: const Icon(Icons.threesixty_outlined),
                onPressed: () {
                  var loadingProvider = context.read<LoadingProvider>();
                  loadingProvider.toggle(!loadingProvider.loading);
                },
              ),
              FloatingActionButton(
                heroTag: 'dfg',
                child: const Icon(Icons.clear),
                onPressed: () {
                  // context.read<ProductProvider>().productList.clear();
                  AccountProvider().clear();
                },
              ),
            ],
          ),
        ),
        Consumer<LoadingProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.yellow),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
