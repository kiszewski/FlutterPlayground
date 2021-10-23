import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class ArgumentsGuard<T> extends RouteGuard {
  final String? redirectTo;
  ArgumentsGuard({this.redirectTo = '/'}) : super(redirectTo: redirectTo);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.args.data != null && Modular.args.data is T;
  }
}
