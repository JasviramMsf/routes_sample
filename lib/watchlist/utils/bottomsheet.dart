import 'package:flutter/material.dart';
import 'package:routes/watchlist/utils/constants.dart';

void showBottomSheetUi(context, sortTypeState, Function(String filterType) sortingCallback) =>
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  FILTER_BY,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      child: Text(
                        FILTER_TYPE_ASCENDING,
                        style: _sortTextStyle(ASCENDING, sortTypeState),
                      ),
                      onPressed: () {
                        sortingCallback(ASCENDING);
                      },
                    ),
                    TextButton(
                      child: Text(
                        textAlign: TextAlign.center,
                        FILTER_TYPE_DESCENDING,
                        style: _sortTextStyle(DESCENDING, sortTypeState),
                      ),
                      onPressed: () {
                        sortingCallback(DESCENDING);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    child: Text(
                      RESET,
                      style: _sortTextStyle(RESET, sortTypeState),
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {
                      sortingCallback(RESET);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

TextStyle _sortTextStyle(type, sortTypeState) {
  return TextStyle(
    fontSize: 18,
    color: type == sortTypeState
        ? Colors.grey
        : const Color.fromARGB(255, 12, 85, 144),
  );
}
