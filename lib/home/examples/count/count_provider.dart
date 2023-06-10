import "package:flutter/material.dart";

class CountProvider with ChangeNotifier {
  int _number = 0;

  int get getNumber => _number;

  void setNumber() {
    _number++;
    notifyListeners();
  }
}
