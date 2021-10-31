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

  double piAlreadyWalkedBigger = 0;
  double piAlreadyWalked = 0;

  double qtdPiToWalk = 0;
  double qtdPiToWalkBiggerPointer = 0;

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
      piAlreadyWalked = widget.store.piAlreadyWalked + widget.store.qtdPiToWalk;

      piAlreadyWalkedBigger = widget.store.piAlreadyWalkedBiggerPointer +
          widget.store.qtdPiToWalkBiggerPointer;

      qtdPiToWalk = widget.store.qtdPiToWalk;
      qtdPiToWalkBiggerPointer = widget.store.qtdPiToWalkBiggerPointer;

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
                  double oldQtdWalk = piAlreadyWalked - qtdPiToWalk;
                  double diff = qtdPiToWalk;

                  double newValue = (controller.value * diff).abs();

                  print('${controller.value} * $diff');

                  return Transform.rotate(
                    angle: oldQtdWalk + newValue,
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
                  double oldQtdWalk =
                      piAlreadyWalkedBigger - qtdPiToWalkBiggerPointer;
                  double diff = qtdPiToWalkBiggerPointer;
                  double newValue = (controller.value * diff).abs();

                  return Transform.rotate(
                    angle: oldQtdWalk + newValue,
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
