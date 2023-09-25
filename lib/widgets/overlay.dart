import 'package:flutter/material.dart';

OverlayEntry createOverlayEntry(
  BuildContext context,
  overlayEntry,
  String searchTxtIndex,
  String searchTxt,
) {
  final searchIndex = double.parse(searchTxtIndex) - 15;
  return overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
        top: searchIndex < 160 ? 160 : searchIndex,
        left: 140.0,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                'Spot price : $searchTxt',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      );
    },
  );
}
