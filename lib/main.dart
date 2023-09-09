import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routes/bst/bt_main.dart';
import 'package:routes/bst/providers/bt_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BtProvider()),
          ],
          child: const BinaryMain(),
        ));
  }
}
