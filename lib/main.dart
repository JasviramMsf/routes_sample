import 'package:flutter/material.dart';
import 'package:routes/watchlist/bloc/watchlist_repo_bloc.dart';
import 'package:routes/watchlist/watchlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 137, 137, 153),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => WatchlistBloc(),
        child: const Watchlist(),
      ),
    );
  }
}
