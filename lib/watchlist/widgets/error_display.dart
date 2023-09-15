import 'package:flutter/material.dart';
import 'package:routes/watchlist/utils/constants.dart';

const Widget errorDisplay = Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.error,
        color: Colors.amber,
        size: 50,
      ),
      Text(
        SOMETHING_WENT_WRONG,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),
      ),
    ],
  ),
);
