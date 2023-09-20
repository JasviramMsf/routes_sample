import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/shunting_yard_input.dart';
import 'package:routes/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => InputProvider(), child:const ShuntingYardAlgorithm()),
    );
  }
}