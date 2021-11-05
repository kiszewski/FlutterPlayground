import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Container(
        width: 500,
        child: Drawer(
          child: RouterOutlet(),
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  Text('main page'),
                  Builder(builder: (context) {
                    return TextButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                        Modular.to.navigate('./red_page_modal');
                      },
                      child: Text('Mostrar modal'),
                    );
                  })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
