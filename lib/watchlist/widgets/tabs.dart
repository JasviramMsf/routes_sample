import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/watchlist/bloc/watchlist_repo_bloc.dart';
import 'package:routes/watchlist/provider/watchlist_provider.dart';
import 'package:routes/watchlist/utils/constants.dart';
import 'package:routes/watchlist/utils/snackbar.dart';
import 'package:routes/watchlist/utils/sort.dart';
import 'package:routes/watchlist/widgets/appbar.dart';
import 'package:routes/watchlist/widgets/list.dart';
import '../utils/tab_list_options.dart';
import 'package:provider/provider.dart';
class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final WatchlistBloc watchlistBloc = BlocProvider.of<WatchlistBloc>(context);
    final watchlistProvider = Provider.of<WatchlistProvider>(context);

    void onItemTapped(int index) {
      watchlistProvider.setSelectedIndex(index);
      watchlistProvider.setWatchlistName(tabItems[index].label);
    }

    void postSorting(String filterType) {
      showSnackBar(
          context,
          OK,
          filterType == ASCENDING
              ? ASCENDING_MSG
              : filterType == DESCENDING
                  ? DESCENDING_MSG
                  : DEFAULT_MSG);

    }

    void sortingCallback(String filterType) async {
      if (watchlistProvider.sortTypeState == filterType) {
        Navigator.pop(context);
        return;
      }
      watchlistProvider.setSortTypeState(filterType);
     
      try {
        sortWatchlist(watchlistBloc, filterType);
        postSorting(filterType);
      } catch (e) {
        showSnackBar(context, FAILED, e.toString());
      }
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 241, 241),
      appBar: appBar(context, watchlistProvider.watchlistName, watchlistProvider.sortTypeState,
          (filterType) => sortingCallback(filterType)),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 0.5),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 28,
          elevation: 10,
          items: tabItems.map(
            (tabItem) {
              return BottomNavigationBarItem(
                  icon: Icon(tabItem.icon),
                  label: tabItem.label,
                  backgroundColor: const Color.fromARGB(221, 255, 255, 255));
            },
          ).toList(),
          currentIndex: watchlistProvider.selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          onTap: onItemTapped,
        ),
      ),
      body: WatchListUi(watchlistProvider.selectedIndex),
    );
  }
}
