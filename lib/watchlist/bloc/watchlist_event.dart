import 'package:routes/watchlist/modal/watchlist_modal.dart';

abstract class WatchlistEvent {}

class GetWatchlistEvent extends WatchlistEvent {}

class WatchlistSortEvent extends WatchlistEvent {
  final List<WatchlistModal> sortedData;
  WatchlistSortEvent(this.sortedData);
}
