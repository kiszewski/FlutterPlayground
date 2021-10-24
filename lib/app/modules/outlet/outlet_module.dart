import 'package:flutter_modular/flutter_modular.dart';

import 'pages/blue_page_modal.dart';
import 'pages/main_page.dart';
import 'pages/red_page_modal.dart';

class OutletModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => MainPage(), children: [
          ChildRoute(
            '/red_page_modal',
            child: (_, args) => RedPageModal(),
          ),
          ChildRoute(
            '/blue_page_modal',
            child: (_, args) => BluePageModal(),
          ),
        ]),
      ];
}
