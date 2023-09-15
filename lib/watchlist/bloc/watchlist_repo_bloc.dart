import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/watchlist/api/api.dart';
import 'package:routes/watchlist/bloc/watchlist_event.dart';
import 'package:routes/watchlist/bloc/watchlist_state.dart';
import 'package:routes/watchlist/utils/constants.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(InitialWatchlistState()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is GetWatchlistEvent) {
        try {
          final response = await fetchWatchlistApi();
          emit(UpdatedWatchlistState(response));
        } catch (e) {
          emit(JsonErrorState(FAILED));
        }
      } else if (event is WatchlistSortEvent) {
          emit(UpdatedWatchlistState(event.sortedData));
      }
    });
  }
}
