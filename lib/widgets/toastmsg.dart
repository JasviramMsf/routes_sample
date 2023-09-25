 import 'package:flutter/material.dart';
 showSnackBar(context,msg) => ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Center(
              child: (Text(
                msg,
                style:const TextStyle(fontSize: 18),
              )),
            ),
          ),
        );