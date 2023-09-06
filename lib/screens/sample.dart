import 'package:flutter/material.dart';
import 'dynamic_screen.dart';

//test file for sample use

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              DynamicScreenTest.routeName,
              arguments: 'From Home Screen',
            );
          },
          child: const Text('Go to Dynamic test screen'),
        ),
      ),
    );
  }
}
