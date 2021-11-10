import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void add(int value) {
    _count += value;
    notifyListeners();
  }

  void subtract(int value) {
    _count -= value;
    notifyListeners();
  }

  void clear() {
    _count = 0;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
