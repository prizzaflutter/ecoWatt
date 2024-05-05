import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class MyBlocObserver extends BlocObserver{
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('BlocObserver - onEvent - bloc: $bloc, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('BlocObserver - onChange - bloc: $bloc, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('BlocObserver - onTransition - bloc: $bloc, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('BlocObserver - onError - bloc: $bloc, error: $error, stackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}