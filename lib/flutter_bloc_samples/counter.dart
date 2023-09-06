import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/flutter_bloc_samples/counter_events.dart';
import 'counter_bloc_state.dart';

class FLutterBlocEx extends StatelessWidget {
  const FLutterBlocEx({super.key});

  @override
  Widget build(BuildContext context) {
    // final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Updates UI only on even numbers !",
            style: TextStyle(fontSize: 20),
          ),
          MultiBlocListener(
              listeners: [
                BlocListener<CounterBloc, int>(
                  listenWhen: (previous, current) {
                    if ((current % 3) == 0) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Center(
                          child: (Text(
                            'Bloc Listener triggered',
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ],
              child: const Text(
                  "") // SnackBar(content: Text("Bloc Listener triggered")),
              ),
          Center(
            child: BlocBuilder<CounterBloc, int>(
              buildWhen: (previous, current) {
                print('$previous $current');
                if ((current % 2) == 0) {
                  return true;
                }
                return false;
              },
              builder: (context, val) {
                return Text(
                  '$val',
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  context.read<CounterBloc>().add(OnPressedIncreament());
                },
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  context.read<CounterBloc>().add(OnPressedDecrement());
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Listener wil be triggered on count of 3!",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
