import 'package:routes/watchlist/modal/watchlist_modal.dart';

abstract class WatchlistState {}

class InitialWatchlistState extends WatchlistState {}

class UpdatedWatchlistState extends WatchlistState {
  final List<WatchlistModal> newList;
  UpdatedWatchlistState(this.newList);
}

class JsonErrorState extends WatchlistState {
  final String error;
  JsonErrorState(this.error);
}
