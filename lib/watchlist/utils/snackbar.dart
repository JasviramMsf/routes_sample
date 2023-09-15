import 'package:flutter/material.dart';
import 'package:routes/watchlist/utils/constants.dart';

void showSnackBar(context, msgType, txt) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: (msgType == OK
            ? const Color.fromARGB(255, 22, 103, 25)
            : Colors.red),
        content: Center(
          child: Text(
            txt,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
