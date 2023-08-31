import 'package:flutter/material.dart';

class DynamicScreenTest extends StatelessWidget {
  static const routeName = '/detail';

  final String data;

  const DynamicScreenTest(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Screen'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
