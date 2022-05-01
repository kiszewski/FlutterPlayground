import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogged;
  setIsLogged(bool? value) => setState(() => isLogged = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          isLogged ?? false
              ? MaterialPage(child: HOMEPAGE())
              : MaterialPage(child: AUTHPAGE()),
          if (isLogged == null) MaterialPage(child: SPLASHPAGE()),
        ],
        onPopPage: (route, result) {
          final r = route.didPop(result);

          return r;
        },
      ),
    );
  }
}

class SPLASHPAGE extends StatelessWidget {
  const SPLASHPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('SPLASH'),
    );
  }
}

class AUTHPAGE extends StatelessWidget {
  const AUTHPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('AUTH'));
  }
}

class HOMEPAGE extends StatelessWidget {
  const HOMEPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('HOME'));
  }
}

class PAGE1 extends StatelessWidget {
  const PAGE1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}

class PAGE2 extends StatelessWidget {
  const PAGE2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue),
    );
  }
}
