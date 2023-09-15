import 'package:routes/watchlist/bloc/watchlist_event.dart';
import 'package:routes/watchlist/bloc/watchlist_state.dart';
import 'package:routes/watchlist/utils/constants.dart';
import 'package:routes/watchlist/modal/watchlist_modal.dart';

void sortWatchlist(watchlistBloc, filterType) {
  final currentState = watchlistBloc.state;
  if (currentState is UpdatedWatchlistState) {
    final List<WatchlistModal> items = currentState.newList;
    switch (filterType) {
      case (ASCENDING):
        {
          items.sort((a, b) => a.name!.compareTo(b.name!));
          watchlistBloc.add(WatchlistSortEvent(items));
        }
      case (DESCENDING):
        {
          items.sort((a, b) => b.name!.compareTo(a.name!));
          watchlistBloc.add(WatchlistSortEvent(items));
        }
      case (RESET):
        {
          items.sort((a, b) => int.parse(a.id!).compareTo(int.parse(b.id!)));
          watchlistBloc.add(WatchlistSortEvent(items));
        }
      default:
        throw Exception(FAILED);
    }
  }
}
