import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Fruit {
  const Fruit();
  String get id;
  @override
  bool operator ==(other) => hashCode == other.hashCode;

  @override
  int get hashCode => hashValues(runtimeType, id);
}

class Banana extends Fruit {
  @override
  final id = 'banana';
  const Banana();
}

class Apple extends Fruit {
  @override
  final id = 'apple';

  const Apple();
}

abstract class FruitFamily {
  static const data = [Banana(), Apple()];
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      errorBuilder: (_, __) => Text('ERRRRRO'),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return SplashPage();
          },
        ),
        GoRoute(
          path: '/auth',
          builder: (context, state) {
            return Text('Login');
          },
        ),
        GoRoute(
            path: '/home',
            builder: (context, state) {
              return HomePage();
            },
            routes: [
              GoRoute(
                path: 'fruits/:fid',
                builder: (context, state) {
                  final fid = state.params['fid']!;
                  final fruit = FruitFamily.data.firstWhere(
                    (f) => f.id == fid,
                    orElse: () => throw Exception('family not found: $fid'),
                  );
                  return FruitTabsScreen(key: state.pageKey, fruit: fruit);
                },
                routes: [
                  GoRoute(
                    path: 'add_banana',
                    builder: (context, state) => const AddBanana(),
                  ),
                  GoRoute(
                    path: 'add_apple',
                    builder: (context, state) => const AddApple(),
                  ),
                ],
              ),
            ]),
      ],
    );
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1)).then((value) => context.go('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Text('SPLASH PG');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text('voltar'),
                onTap: () {
                  context.pop();
                },
              ),
              TextButton(
                onPressed: () {
                  context.go('/home/fruits/banana');
                },
                child: Text('ir pra frutas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitTabsScreen extends StatefulWidget {
  final int index;
  FruitTabsScreen({required Fruit fruit, Key? key})
      : index = FruitFamily.data.indexWhere((f) => f.id == fruit.id),
        super(key: key);

  @override
  _FruitTabsScreenState createState() => _FruitTabsScreenState();
}

class _FruitTabsScreenState extends State<FruitTabsScreen>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: FruitFamily.data.length,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FruitTabsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('fruits'),
          bottom: TabBar(
            controller: _controller,
            tabs: [for (final f in FruitFamily.data) Tab(text: f.id)],
            onTap: (index) => context.go(
              '/home/fruits/${FruitFamily.data[index].id}',
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            for (final fruit in FruitFamily.data)
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: ListTile(
                        title: Text(fruit.id),
                        trailing: FloatingActionButton(
                          child: const Icon(Icons.add),
                          onPressed: () => context.go(
                            '/home/fruits/${fruit.id}/add_${fruit.id}',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text('voltar'),
                      onTap: () {
                        context.pop();
                      },
                    )
                  ],
                ),
              )
          ],
        ),
      );
}

abstract class AddFruit extends StatelessWidget {
  final Fruit fruit;
  const AddFruit({
    required this.fruit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(title: Text('add ${fruit.id}')),
        body: Center(
            child: InkWell(
          child: Text('voltar'),
          onTap: () {
            context.pop();
          },
        )),
      );
}

class AddBanana extends AddFruit {
  const AddBanana({Key? key}) : super(fruit: const Banana(), key: key);
}

class AddApple extends AddFruit {
  const AddApple({Key? key}) : super(fruit: const Apple(), key: key);
}
