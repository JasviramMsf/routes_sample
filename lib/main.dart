import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/option_chain_list.dart';
import 'package:routes/state_management/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (_) => SearchProvider(), child: const OptionChainList()),
    );
  }
}
