import 'package:flutter/material.dart';
import 'package:routes/screens/dynamic_screen.dart';
import 'package:routes/screens/screens_container.dart';

class RouteMainApp extends StatelessWidget {
  const RouteMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/first',
      routes: {
        '/first': (context) => const Screen1(),
        '/second': (context) => const Screen2(name: 'Screen two'),
        '/third': (context) => const Screen3(),
      },
      onGenerateRoute: (val) {
        if (val.name == DynamicScreenTest.routeName) {
          final dynamic args = val.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return DynamicScreenTest(args);
            },
          );
        }
      },
    );
  }
}
