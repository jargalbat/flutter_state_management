import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/cart_notifier.dart';
import 'package:flutter_state_management/provider_api/accounts_route.dart';
import 'package:provider/provider.dart';

import 'provider_api/loading_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartNotifier()),
        // ChangeNotifierProvider(create: (_) => LoadingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProviderRoute(),
      // home: const ProductsRoute(),
      home: const AccountsRoute(),
    );
  }
}
