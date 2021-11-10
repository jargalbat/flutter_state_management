import 'dart:collection';
import 'package:flutter/cupertino.dart';

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

  Future<void> fetchAcntList() async {
    var acnt = Account()
      ..acntNo = 2
      ..acntName = 'Test2';

    await Future.delayed(const Duration(milliseconds: 5000));

    _acntList.add(acnt);
    _acntList.add(acnt);
    notifyListeners();
  }
}
