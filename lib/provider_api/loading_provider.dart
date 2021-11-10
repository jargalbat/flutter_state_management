import 'package:flutter/cupertino.dart';

class LoadingProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void toggle(bool value) {
    _loading = value;
    notifyListeners();
  }
}
