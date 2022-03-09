import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorReportingService extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(bloc);
    print(error);
    print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
