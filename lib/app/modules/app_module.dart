import 'package:challenges_app/app/modules/clock_timer/clock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'arguments/arguments_module.dart';
import 'gpl_consumer/github_repositories_page.dart';
import 'gpl_consumer/gpl_client.dart';
import 'home/home_page.dart';
import 'clock_timer/controller/counter_store.dart';
import 'outlet/outlet_module.dart';

class AppModule extends Module {
  @override
  get binds => [
        Bind.lazySingleton((i) => CounterStore()),
        Bind.lazySingleton((i) => GplClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomePage(),
          children: [
            ChildRoute('/right_modal',
                child: (_, __) =>
                    Material(child: Container(color: Colors.blue))),
            ChildRoute('/repositories_page',
                child: (_, __) => Material(
                      child: GithubRepositoriesPage(),
                    )),
            ModuleRoute(
              '/clock_timer',
              module: ClockModule(),
            ),
            ModuleRoute(
              '/arguments',
              module: ArgumentsModule(),
            ),
            ModuleRoute(
              '/outlet',
              module: OutletModule(),
            ),
          ],
        ),
        WildcardRoute(
          child: (_, __) => Material(child: Text('WildCard App Module')),
        )
      ];
}
