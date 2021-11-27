import 'package:challenges_app/app/modules/paint/paint_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomPaintsModule extends Module {
  @override
  final binds = [];

  @override
  final routes = [
    ChildRoute('/', child: (_, __) => PaintPage()),
  ];
}
