import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account_provider.dart';
import 'accounts_cart_route.dart';
import 'loading_provider.dart';

class AccountsRoute extends StatefulWidget {
  const AccountsRoute({Key? key}) : super(key: key);

  @override
  _AccountsRouteState createState() => _AccountsRouteState();
}

class _AccountsRouteState extends State<AccountsRoute> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider.value(value: AccountProvider()),
      ],
      child: const AccountsScreen(),
    );
  }
}

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<AccountProvider>().fetchAcntList(context, context.read<LoadingProvider>()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Acnt list'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AccountProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  debugPrint('loading: ${value.loading}');

                  // setState(() {
                  //   _isLoading = value.loading;
                  // });

                  // if (value.loading) {
                  //   return const CircularProgressIndicator();
                  // } else {
                  //   // return Text('${context.watch<ProductProvider>().productList.length}');
                  //   return Container(
                  //       decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                  //       margin: const EdgeInsets.only(right: 15.0),
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: Text('${AccountProvider().acntList.length}'));
                  // }

                  return Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                      margin: const EdgeInsets.only(right: 15.0),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${AccountProvider().acntList.length}'));
                },
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: 'qwe',
                child: const Icon(Icons.threesixty_outlined),
                onPressed: () {
                  var loadingProvider = context.read<LoadingProvider>();
                  loadingProvider.toggle(!loadingProvider.loading);
                },
              ),
              FloatingActionButton(
                heroTag: '1',
                child: const Icon(Icons.add),
                onPressed: () {
                  var acnt = Account()
                    ..acntNo = 1
                    ..acntName = 'test';

                  // context.read<AccountProvider>().add(acnt);
                  // Provider.of<AccountProvider>(context, listen: false).add(acnt);
                  AccountProvider().add(acnt);
                },
              ),
              FloatingActionButton(
                heroTag: '2',
                child: const Icon(Icons.arrow_forward_ios),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountsCartRoute())),
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
