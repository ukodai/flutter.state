import "package:flutter/material.dart";

class SliderProvider with ChangeNotifier {
  double _value = 1.0;

  double get getValue => _value;

  void setValue(double value) {
    _value = value;
    notifyListeners();
  }
}
