import 'package:flutter/material.dart';
import 'package:routes/watchlist/utils/bottomsheet.dart';

AppBar appBar(context, watchlistName, sortTypeState,
        Function(String filterType) sortingCallback) =>
    AppBar(
      title: Text(
        watchlistName,
        style: const TextStyle(
          color: Color.fromARGB(255, 12, 85, 144),
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            showBottomSheetUi(context, sortTypeState,
                (filterType) => sortingCallback(filterType));
          },
        ),
      ],
    );
