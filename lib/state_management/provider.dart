import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _searchtxt = '';

  String get searchtxt => _searchtxt;

  void setSearchtxt(String val) {
    _searchtxt = val;
    notifyListeners();
  }
}
