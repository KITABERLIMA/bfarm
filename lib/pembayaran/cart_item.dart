import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class cart_item extends ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void addItem() {
    _itemCount++;
    notifyListeners();
  }

  void removeItem() {
    if (_itemCount > 0) {
      _itemCount--;
      notifyListeners();
    }
  }
}



