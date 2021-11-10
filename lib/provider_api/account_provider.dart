import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_provider.dart';

class Account {
  int? acntNo;
  String? acntName;
}

class AccountProvider with ChangeNotifier {
  // Instance - Constructor
  static final AccountProvider _instance = AccountProvider._internal();

  factory AccountProvider() {
    return _instance;
  }

  AccountProvider._internal() {
    debugPrint('ProductProvider instance created');
  }

  // State - Attributes
  bool _loading = false;

  bool get loading => _loading;

  final List<Account> _acntList = [
    Account()
      ..acntNo = 1
      ..acntName = 'Test',
  ];

  UnmodifiableListView<Account> get acntList => UnmodifiableListView(_acntList);

  // Behavior (Зан төлөв)
  void add(Account? acnt) {
    if (acnt != null) {
      _acntList.add(acnt);
      notifyListeners();
    }
  }

  void clear() {
    _acntList.clear();
    notifyListeners();
  }

  Future<void> fetchAcntList(context, loadingProvider) async {
    var acnt = Account()
      ..acntNo = 2
      ..acntName = 'Test2';

    // Loading
    loadingProvider.toggle(true);
    _loading = true;

    await Future.delayed(const Duration(milliseconds: 1000));

    if (true) {
      _acntList.add(acnt);
      _acntList.add(acnt);
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Failed'),
          content: Text('No data'),
        ),
      );
    }

    // Loading
    loadingProvider.toggle(false);
    _loading = false;

    notifyListeners();
  }
}
