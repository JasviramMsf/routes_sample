import 'package:flutter/material.dart';

class DynamicTextProvider extends ChangeNotifier {
  String _dynamicLabel = "";
  String get dynamicLabel => _dynamicLabel;

  void concatLabel(val) {
    _dynamicLabel = _dynamicLabel + val;
    notifyListeners();
  }
}
