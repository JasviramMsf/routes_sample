import 'package:flutter/material.dart';

import 'dynamic_screen.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen one'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This screen will pop out from stack after navigation"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Go to Screen two'),
              onPressed: () {
                print(Navigator.canPop(context));
                Navigator.pushReplacementNamed(context, "/second");
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Screen2(name: "Screen two"),
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) =>const Screen2(name:"Screen two")),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Screen3(),
                  settings: const RouteSettings(arguments: "Arg pass test")),
            );
          },
          child: const Text('Go to screen 3'),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final String val = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Three"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              child: const Text('Go back'),
            ),
            Text(val),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DynamicScreenTest.routeName,
                    arguments: "Dynamic screen argument");
              },
              child: const Text('Go to dynamic screen'),
            ),
          ],
        ),
      ),
    );
  }
}
