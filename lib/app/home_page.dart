import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/challenge_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    super.initState();
  }

  toggle() => _animationController.isCompleted
      ? _animationController.reverse()
      : _animationController.forward();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool _canBeDragged = true;

    _onDragStart(DragStartDetails details) {
      print('Start: ${details.globalPosition.dx}');
      bool isDragOpenFromLeft =
          details.globalPosition.dx < 100 && _animationController.isDismissed;
      bool isDragClosedFromRight = details.globalPosition.dx > (width / 2) &&
          _animationController.isCompleted;

      _canBeDragged = isDragOpenFromLeft || isDragClosedFromRight;
    }

    _onDragUpdate(DragUpdateDetails details) {
      print('Update: ${details.globalPosition.dx}');
      if (_canBeDragged) {
        double delta = details.primaryDelta! / (width / 2);
        _animationController.value += delta;
        print(details.primaryDelta);
      }
    }

    _onDragEnd(DragEndDetails details) {
      print('End: ${details.velocity}');
      if (_animationController.isCompleted || _animationController.isDismissed)
        return;
      if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
        double visualVelocity = details.velocity.pixelsPerSecond.dx / width;

        _animationController.fling(velocity: visualVelocity);
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blueAccent,
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(vertical: height / 3),
            child: ListView(
              children: [
                ChallengeItemWidget(
                  name: 'Timer Challenge',
                  route: '/clock_timer',
                ),
                ChallengeItemWidget(
                  name: 'Container Vermelho',
                  route: '/red_screen',
                ),
                ChallengeItemWidget(
                  name: 'Container Azul',
                  route: '/blue_screen',
                ),
              ],
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragEnd: _onDragEnd,
            onHorizontalDragUpdate: _onDragUpdate,
            child: Center(
              child: AnimatedBuilder(
                builder: (context, child) => Transform(
                  transform: Matrix4.translationValues(
                    _animationController.value * (width / 2),
                    0,
                    0,
                  ),
                  child: Container(
                    width: width,
                    height:
                        height - (_animationController.value * (height / 3)),
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: toggle,
                              child: Icon(Icons.menu),
                            ),
                          ],
                        ),
                        Expanded(child: RouterOutlet())
                      ],
                    ),
                  ),
                ),
                animation: _animationController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
