import "package:flutter/material.dart";

class FavoriteProvider with ChangeNotifier {
  final List<int> _list = [];

  List<int> get getList => _list;

  void cList(int value) {
    _list.contains(value) ? _list.remove(value) : _list.add(value);
    notifyListeners();
  }

  bool contains(int value) {
    return _list.contains(value);
  }
}
