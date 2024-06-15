import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver{
  @override
  void onEvent(Bloc bloc, Object? event) {
     ('BlocObserver - onEvent - bloc: $bloc, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
     ('BlocObserver - onChange - bloc: $bloc, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
     ('BlocObserver - onTransition - bloc: $bloc, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
     ('BlocObserver - onError - bloc: $bloc, error: $error, stackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}