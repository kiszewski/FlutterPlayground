import 'package:challenges_app/app/modules/clock_timer/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/green_page.dart';

class ClockModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => CounterPage()),
        ChildRoute('/green', child: (_, __) => GreenPage()),
        WildcardRoute(
          child: (_, __) => Text('WildCard Clock module'),
        )
      ];
}
