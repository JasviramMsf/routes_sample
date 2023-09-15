import 'package:flutter/material.dart';
import 'package:routes/watchlist/bloc/watchlist_repo_bloc.dart';
import 'package:routes/watchlist/bloc/watchlist_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/watchlist/provider/watchlist_provider.dart';
import 'package:routes/watchlist/widgets/tabs.dart';
import 'package:provider/provider.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({super.key});

  @override
  Widget build(BuildContext context) {
    final watchlistBloc = BlocProvider.of<WatchlistBloc>(context);
    watchlistBloc.add(GetWatchlistEvent());

    return ChangeNotifierProvider(
        create: (_) => WatchlistProvider(), child: const WatchlistTabs());
  }
}
