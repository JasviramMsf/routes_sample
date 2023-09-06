import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes/flutter_bloc_samples/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<OnPressedIncreament>((event, emit) => emit(state + 1));
    on<OnPressedDecrement>((event, emit) => emit(state - 1));
  }
}
