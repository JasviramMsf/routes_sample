import 'package:flutter/material.dart';

Widget node(modalObj) => Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.yellow, width: 2)),
      child: InkWell(
        child: Text(
          modalObj.nodeValue.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 15),
        ),
      ),
    );
