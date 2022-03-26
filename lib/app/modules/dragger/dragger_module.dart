import 'package:challenges_app/app/modules/dragger/dragger_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DraggerModule extends Module {
  @override
  final binds = [];

  @override
  final routes = [
    ChildRoute('/', child: (_, __) => DraggerPage()),
  ];
}
