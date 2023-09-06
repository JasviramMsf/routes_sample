import 'package:routes/flutter_bloc_samples/counter.dart';
import 'package:flutter/material.dart';
import 'package:routes/provider_samples/dynamic_text.dart';
import 'flutter_bloc_samples/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateMainApp extends StatelessWidget {
  const StateMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: BlocProvider(
        create: (context) => CounterBloc(),
        child:Scaffold(
          appBar: AppBar(
            title:const Text("State Management"),
          ),
          body: const ProviderEx(), 
        ) 
      ),
    );
  }
}

 /// replace any one function in body param
// FLutterBlocEx(), 
// ProviderEx()