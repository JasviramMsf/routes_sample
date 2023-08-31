import 'package:flutter/material.dart';
import 'package:routes/screens/dynamic_screen.dart';
import 'package:routes/screens/screens_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/second',
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
      // home: DefaultTabController(
      //   length: 3,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       backgroundColor: Colors.blueGrey,
      //       bottom: const TabBar(
      //         tabs: [
      //           Tab(
      //             text: "AC",
      //             icon: Icon(Icons.ac_unit),
      //           ),
      //           Tab(icon: Icon(Icons.access_alarm)),
      //           Tab(icon: Icon(Icons.zoom_out_sharp)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
