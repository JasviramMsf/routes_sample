import 'package:flutter/material.dart';
import 'package:routes/watchlist/utils/constants.dart';
import 'package:routes/watchlist/utils/tab_list_options.dart';

class WatchlistProvider extends ChangeNotifier {
  String _watchlistName = tabItems[0].label;
  String _sortTypeState = RESET;
  int _selectedIndex = 0;

  String get watchlistName => _watchlistName;
  String get sortTypeState => _sortTypeState;
  int get selectedIndex => _selectedIndex;

  void setWatchlistName(String val) {
    _watchlistName = val;
    notifyListeners();
  }

  void setSortTypeState(String val) {
    _sortTypeState = val;
    notifyListeners();
  }

  void setSelectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }
}
