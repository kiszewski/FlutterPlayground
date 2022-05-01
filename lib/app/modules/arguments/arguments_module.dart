import 'package:challenges_app/app/modules/arguments/models/param_data_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'arguments_guard.dart';
import 'pages/first_page.dart';
import 'pages/second_page.dart';

class ArgumentsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => FirstPage(), children: [
          ChildRoute('/second/',
              child: (_, args) => SecondPage(data: args.data),
              guards: [ArgumentsGuard<ParamData>(redirectTo: '/arguments/')]),
        ]),
      ];
}
