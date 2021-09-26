import 'package:challenges_app/app/modules/clock_timer/clock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_page.dart';
import 'clock_timer/controller/counter_store.dart';

class AppModule extends Module {
  @override
  get binds => [Bind.lazySingleton((i) => CounterStore())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage(), children: [
          ChildRoute('/blue_screen',
              child: (_, __) => Material(child: Container(color: Colors.blue))),
          ChildRoute('/red_screen',
              child: (_, __) => Material(
                    child: Container(color: Colors.red),
                  )),
          ModuleRoute('/clock_timer', module: ClockModule()),
        ])
      ];
}
