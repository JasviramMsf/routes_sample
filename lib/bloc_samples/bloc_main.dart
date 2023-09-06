import 'dart:async';

import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  blocMain();
}

blocMain() async {
  final bloc = TextBuilder();

  print(bloc.state);

  bloc.add(OnPressedEvent(" text building..."));

  await Future<void>.delayed(const Duration(seconds: 1));

  print(bloc.state);

  for (int i = 0; i < 6; i++) {
      bloc.add(OnPressedEvent(""));
      await Future<void>.delayed(const Duration(seconds: 1));
      print(bloc.state);
  }

  await bloc.close();
}

abstract class BlocEvent {}

class OnPressedEvent extends BlocEvent {
  OnPressedEvent(this.val);
  final String val;
}

class TextBuilder extends Bloc<BlocEvent, String> {
  int count = 0;
  TextBuilder() : super("Hi") {
    on<OnPressedEvent>(
        (event, emit) => emit(state + event.val + (count++).toString()));
  }
}

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    // print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    // print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    // print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    // print('onClose -- bloc: ${bloc.runtimeType}');
  }
}
