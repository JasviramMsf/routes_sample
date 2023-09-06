import 'package:flutter/material.dart';

class VisiblityProvider extends ChangeNotifier {
  bool _visibility = true;

  bool get visibility => _visibility;

  void changeVisibility() {
    _visibility = (_visibility ? false : true);
    notifyListeners();
  }
}
