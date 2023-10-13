import '../../domain/bloc_exports.dart';
import 'dart:developer' as dev;

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    dev.log(name: '${bloc.runtimeType}', 'EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    dev.log(name: '${bloc.runtimeType}', 'CHANGE: $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    dev.log(
      name: '${bloc.runtimeType}',
      'ERROR:',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    dev.log(name: '${bloc.runtimeType}', 'TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }
}
