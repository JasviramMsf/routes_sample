import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  String _inputTxt = '';
  bool _showOutput = false;

  String get inputTxt => _inputTxt;

  bool get showOutput => _showOutput;

  void setInputtxt(String val) {
    _inputTxt = val;
    notifyListeners();
  }

  void setOutputVisibility(bool val) {
    _showOutput = val;
    notifyListeners();
  }
}
