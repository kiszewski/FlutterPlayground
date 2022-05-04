import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';
import 'app/modules/app_module.dart';

void main() {
  throw Exception('Test to revert pull request');

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
