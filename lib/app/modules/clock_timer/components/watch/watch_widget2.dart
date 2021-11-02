import 'package:challenges_app/app/modules/clock_timer/components/watch/watch_store.dart';
import 'package:challenges_app/app/modules/clock_timer/utils/clock_positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class WatchWidget2 extends StatefulWidget {
  final WatchStore store;

  const WatchWidget2({
    Key? key,
    required this.store,
  }) : super(key: key);
  @override
  _WatchWidget2State createState() => _WatchWidget2State();
}

class _WatchWidget2State extends State<WatchWidget2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double diffSmallPointer = 0;
  double diffBiggerPointer = 0;

  double startSmallPointer = 0;
  double startBiggerPointer = 0;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    autorun((p0) {
      widget.store.endPosition;

      move();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  move() async {
    if (!controller.isAnimating) {
      controller.reset();

      diffSmallPointer = widget.store.diffSmallPointer;
      diffBiggerPointer = widget.store.diffBiggerPointer;

      startSmallPointer = widget.store.startPosition.smallPointer;
      startBiggerPointer = widget.store.startPosition.biggerPointer;

      await controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final circleDiameter = 35.0;

    return Container(
      height: circleDiameter,
      width: circleDiameter,
      child: Stack(
        children: [
          Positioned(
            bottom: circleDiameter * 0.5,
            child: AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: startSmallPointer +
                        (controller.value * diffSmallPointer),
                    child: Container(
                      width: circleDiameter,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: circleDiameter * 0.5,
            child: AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: startBiggerPointer +
                        (controller.value * diffBiggerPointer),
                    child: Container(
                      width: circleDiameter,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Center(
            child: Container(
              height: circleDiameter,
              width: circleDiameter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black12, width: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
